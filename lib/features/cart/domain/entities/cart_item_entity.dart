import 'package:shopest/features/cart/data/models/cart_item_model.dart';

class CartItemEntity {
  String id;
  String images;
  int price;
  String title;

  // добавление, чтобы считать в стаке
  int numberInStack = 1;

  CartItemEntity({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });
  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      CartItemModel.fromJson(json);
}
