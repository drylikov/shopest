// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      delivery: json['delivery'] as String,
      id: json['id'] as String,
      total: json['total'] as int,
      basket: (json['basket'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'delivery': instance.delivery,
      'id': instance.id,
      'total': instance.total,
      'basket': instance.basket,
    };
