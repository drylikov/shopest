import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/core/usecases/usecases.dart';
import 'package:shopest/features/cart/data/models/cart_model.dart';
import 'package:shopest/features/cart/domain/repositories/cart_repositoty.dart';

class GetCart extends UseCases<CartModel, CartParams> {
  final CartRepository _cartRepository;
  CartParams? params;

  GetCart(this._cartRepository, [this.params]);

  @override
  Future<Either<Failure, CartModel>> call([CartParams? params]) async {
    if (params != null) {
      return _cartRepository.getCartOfUser(params.identificatorOfUser);
    } else {
      return  _cartRepository.getCart();
    }
  }
}

class CartParams extends Equatable {
  final String? identificatorOfUser;
  @override
  List<Object?> get props => [identificatorOfUser];
  const CartParams([this.identificatorOfUser]);
}
