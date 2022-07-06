import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/core/firebase/push_service.dart';
import 'package:shopest/core/navigator_key_service/navigator_key_service.dart';
import 'package:shopest/features/cart/presentation/pages/cart_page.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';
import 'package:shopest/features/facepage/presentation/pages/face_page.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/gallery/presentation/pages/gallery.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';
import 'package:shopest/features/google_map/presentation/pages/googlemappage.dart';
import 'package:shopest/service_locator.dart';
import 'package:shopest/service_locator.dart' as inject;
import 'package:shopest/theme.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  await inject.init();
  runApp(const MyApp());
  await initMessageService();
  await listenDeepLinks();
}

Future<void> initMessageService() async {
  await Firebase.initializeApp().then((_) {
    PushNotificationService(FirebaseMessaging.instance).call();
  });
}

Future<void> listenDeepLinks() async {
  uriLinkStream.listen((uri) {
    NavigatorKeyService.navigateTo(uri!.path);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FacePageProvider>.value(
          value: sl(),
        ),
        ChangeNotifierProvider<GalleryProvider>.value(
          value: sl(),
        ),
        ChangeNotifierProvider<CartProvider>.value(
          value: sl(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ru', ''),
        ],
        theme: getTheme(),
        navigatorKey: NavigatorKeyService.navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => const FacePage(),
          '/gallery': (context) => const Gallery(),
          '/cart': (context) => const CartPage(),
          '/map': (context) => const GoogleMapPage(),
        },
      ),
    );
  }
}
