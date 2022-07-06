import 'package:shopest/features/cart/data/models/cart_model.dart';
import 'package:shopest/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  String delivery;
  String id;
  int total;
  List<CartItemEntity> basket;

  CartEntity({
    required this.delivery,
    required this.id,
    required this.total,
    required this.basket,
  });

  factory CartEntity.fromJson(Map<String, dynamic> j) =>
      CartModel.fromJson(j);
}
