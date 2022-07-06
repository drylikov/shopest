import 'package:dartz/dartz.dart';
import 'package:shopest/core/error/exception.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:shopest/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:shopest/features/cart/data/models/cart_item_model.dart';
import 'package:shopest/features/cart/data/models/cart_model.dart';
import 'package:shopest/features/cart/domain/repositories/cart_repositoty.dart';

class CartRepositoryImlp implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  CartLocalDataSource localDataSource;
  CartRepositoryImlp(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    return await _getCart(() {
      return remoteDataSource.getCart();
    });
  }

  @override
  Future<Either<Failure, CartModel>> getCartOfUser(
      String? identificatorOfUser) async {
    return await _getCartOfUser(() {
      return remoteDataSource.getCartOfUser(identificatorOfUser!);
    });
  }

  Future<Either<Failure, CartModel>> _getCart(
      Future<CartModel> Function() getCart) async {
    CartModel? cartModel;
    try {
      List<CartItemModel?> cartListItems = await localDataSource.getCartItems();
      cartModel = await localDataSource.getCart(cartListItems);
      return Right(cartModel!);
    } catch (error) {
 
    }
    try {
      List<CartItemModel> list = List.empty(growable: true);

      CartModel cartModel = await getCart();

      localDataSource.casheCart(cartModel.toMap());
      for (var cartItemModel in cartModel.basket) {
        list.add(cartItemModel as CartItemModel);
      }
      list.forEach((elem) {
        localDataSource.casheCartItems(elem.toMap());
      });
      return Right(cartModel);
    } catch (error) {

    }
    return Left(ServerFailure());
  }

  Future<Either<Failure, CartModel>> _getCartOfUser(
      Future<CartModel> Function() getCartOfUser) async {
    try {
      CartModel model = await remoteDataSource.getCart();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
