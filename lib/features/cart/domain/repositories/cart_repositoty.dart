import 'package:dartz/dartz.dart';

import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/cart/data/models/cart_model.dart';

abstract class CartRepository {
  
  Future<Either<Failure,CartModel>> getCart();
   Future<Either<Failure,CartModel>> getCartOfUser(String? identificatorOfUser);

}
