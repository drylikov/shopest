

// ignore_for_file: overridden_fields, annotate_overrides, invalid_override

import 'package:json_annotation/json_annotation.dart';
import 'package:shopest/features/cart/data/models/cart_item_model.dart';
import 'package:shopest/features/cart/domain/entities/cart_entity.dart';
import 'package:shopest/features/cart/domain/entities/cart_item_entity.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends CartEntity {
  String delivery;
  String id;
  int total;
  List<CartItemEntity> basket;

  List<Object> get props => [
        this.delivery,
        this.id,
        this.basket,
        this.total,
      ];
  CartModel({
    required this.delivery,
    required this.id,
    required this.total,
    required this.basket,
  }) : super(delivery: delivery, id: id, total: total, basket: basket);

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  factory CartModel.fromMap(
    Map<String, dynamic> map,
    List<CartItemModel> basket,
  ) {
    return CartModel(
      delivery: map['delivery'] as String,
      id: map['id'] as String,
      total: map['total'] as int,
      basket: basket,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['delivery'] = delivery;
    map['id'] = id;
    map['total'] = total;
    return map;
  }
}
