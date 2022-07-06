import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopest/core/network/client_service.dart';
import 'package:shopest/features/cart/data/models/cart_model.dart';

part 'cart_remote_data_source.g.dart';

@RestApi(
  baseUrl: 'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149/',
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('')
  Future<CartModel> getCart();
}

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<CartModel> getCartOfUser(String? identificatorOfUser);
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  ClientService client;
  CartRemoteDataSourceImpl(this.client);

  @override
  Future<CartModel> getCart() => _getCart();
  @override
  Future<CartModel> getCartOfUser(String? identificatorOfUser) =>
      _getCartOfUser(identificatorOfUser);

  Future<CartModel> _getCart() async {
    /* Response<dynamic> response;
    response = await client.get(_path);
    CartModel cart;
    Map<String, dynamic> responseBody = response.data;
    cart = CartModel.fromJson(responseBody); */

    return await RestClient(client.dio).getCart();
  }

  Future<CartModel> _getCartOfUser(String? identificatorOfUser) async {
    /* Response<dynamic> response;
    response = await client.get(_path);
    CartModel cart;
    Map<String, dynamic> responseBody = response.data;
    cart = CartModel.fromJson(responseBody); */

    return await RestClient(client.dio).getCart();
  }
}
