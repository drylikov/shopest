import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopest/core/network/client_service.dart';
import 'package:shopest/features/facepage/data/models/phone_model.dart';
import 'package:shopest/features/facepage/data/models/store_list.dart';

part 'phonehome_remote_datasource.g.dart';

@RestApi(
    baseUrl: 'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175/',)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('')
  Future<StoreList> getHomeStorePhones();
}

// не актуально с Rest api
abstract class PhoneHomeRemoteSource {
  Future<List<PhoneModel>> getHomeStorePhones();
  Future<List<PhoneModel>> getPhonesHomeOfUser(String identificatorOfUser);
}

class PhoneHomeRemoteDataSourceImpl extends PhoneHomeRemoteSource {
  ClientService client;

  PhoneHomeRemoteDataSourceImpl(this.client);
  @override
  Future<List<PhoneModel>> getHomeStorePhones() async {
    final storelist = await RestClient(client.dio).getHomeStorePhones();

    return storelist.best_seller!;
  }

  @override
  Future<List<PhoneModel>> getPhonesHomeOfUser(
      String identificatorOfUser,) async {
    final storelist = await RestClient(client.dio).getHomeStorePhones();

    return storelist.best_seller!;
  }
}
