import 'package:get_it/get_it.dart';
import 'package:shopest/core/navigator_key_service/navigator_key_service.dart';
import 'package:shopest/core/network/client_service.dart';
import 'package:shopest/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shopest/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:shopest/features/cart/data/repositories/cart_repositories.dart';
import 'package:shopest/features/cart/domain/repositories/cart_repositoty.dart';
import 'package:shopest/features/cart/domain/usecases/get_cart.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';
import 'package:shopest/features/facepage/data/datasources/phonehome_local_datasource.dart';
import 'package:shopest/features/facepage/data/datasources/phonehome_remote_datasource.dart';
import 'package:shopest/features/facepage/data/repositories/phonehome_repository.dart';
import 'package:shopest/features/facepage/domain/repositories/phones_home_repository.dart';
import 'package:shopest/features/facepage/domain/usecases/phone_usecase.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/gallery/data/datasources/describe_local_datasource.dart';
import 'package:shopest/features/gallery/data/datasources/describe_remote_datasource.dart';
import 'package:shopest/features/gallery/data/repositories/describe_repository.dart';
import 'package:shopest/features/gallery/domain/repositories/describe_repository.dart';
import 'package:shopest/features/gallery/domain/usecases/get_describe.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Provider
  sl..registerFactory(FacePageProvider.new)
  ..registerFactory(GalleryProvider.new)
  ..registerFactory(CartProvider.new)
  // Usecases
  ..registerLazySingleton(() => GetHomeStorePhones(sl()))
  ..registerLazySingleton(() => GetDescribe(sl()))
  ..registerLazySingleton(() => GetCart(sl()))
  // Repository
  ..registerLazySingleton<PhonesHomeRepository>(
      () => PhoneHomeRepositoryImpl(sl(), sl()),)
  ..registerLazySingleton<DescribeRepository>(
      () => DescribeRepositoryImpl(sl(), sl()),)
  ..registerLazySingleton<CartRepository>(
      () => CartRepositoryImlp(sl(), sl()),)
  // DataSource
  ..registerLazySingleton<PhoneHomeRemoteSource>(
      () => PhoneHomeRemoteDataSourceImpl(ClientService()),)
  ..registerLazySingleton<DescribeRemoteDataSource>(
      () => DescribeRemoteDataSourceImpl(ClientService()),)

  ..registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(ClientService()),)

  ..registerLazySingleton<CartLocalDataSource>(
      CartLocalDataSourceImpl.new,)
  ..registerLazySingleton<PhoneHomeLocalSource>(
      PhoneHomeLocalSourceImpl.new,)
  ..registerLazySingleton<DescribeLocalDataSource>(
      DescribeLocalDataSourceImpl.new,)
  // Core
  // ... (errors, etc)
  //Firebase services
  /* sl.registerSingletonAsync<FirebaseApp>(() => Firebase.initializeApp());
  sl.registerSingletonAsync<FirebaseMessaging>(
    () => FirebaseMessaging.instance as Future<FirebaseMessaging>,
    dependsOn: [FirebaseApp]
  );
  sl.registerLazySingleton<PushNotificationService>(
      () => PushNotificationService(sl<FirebaseMessaging>())); */
  //Navigator service
  ..registerLazySingleton(NavigatorKeyService.new)
  // External
  ..registerSingleton(ClientService.new);
}
