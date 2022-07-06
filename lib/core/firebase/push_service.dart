import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shopest/core/navigator_key_service/navigator_key_service.dart';

class PushNotificationService {
  dynamic fcmToken;
  FirebaseMessaging messaging;

  PushNotificationService(this.messaging);

  Future<void> call() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['type'] == 'cart') {
        NavigatorKeyService.navigateTo('/cart');
      }
    });

    //    fcmToken = await messaging.getToken();
  }
}
