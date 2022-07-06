import 'package:json_annotation/json_annotation.dart';
import 'package:shopest/features/cart/domain/entities/cart_item_entity.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel extends CartItemEntity {
  CartItemModel({
    required int id,
    required String images,
    required int price,
    required String title,
  }) : super(id: id.toString(), images: images, price: price, title: title);

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as int,
      images: map['images'] as String,
      price: map['price'] as int,
      title: map['title'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['images'] = images;
    map['price'] = price;
    map['title'] = title;
    return map;
  }
}
