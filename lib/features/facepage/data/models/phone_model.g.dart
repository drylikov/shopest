// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) => PhoneModel(
      isFavorites: json['isFavorites'] as bool?,
      priceWithoutDiscount: json['priceWithoutDiscount'] as int?,
      discountPrice: json['discountPrice'] as int?,
      is_new: json['is_new'] as bool?,
      subtitle: json['subtitle'] as String?,
      is_buy: json['is_buy'] as bool?,
      id: json['id'] as int,
      title: json['title'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$PhoneModelToJson(PhoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_new': instance.is_new,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'picture': instance.picture,
      'is_buy': instance.is_buy,
      'isFavorites': instance.isFavorites,
      'priceWithoutDiscount': instance.priceWithoutDiscount,
      'discountPrice': instance.discountPrice,
    };
