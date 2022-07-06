// ignore_for_file: non_constant_identifier_names, avoid_dynamic_calls
// ignore_for_file: argument_type_not_assignable
import 'package:json_annotation/json_annotation.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';

part 'phone_model.g.dart';

@JsonSerializable()
class PhoneModel extends PhonesEntity {
  PhoneModel({
    required bool? isFavorites,
    required int? priceWithoutDiscount,
    required int? discountPrice,
    required bool? is_new,
    required String? subtitle,
    required bool? is_buy,
    required int id,
    required String title,
    required String picture,
  }) : super(
          id: id,
          is_new: is_new,
          title: title,
          subtitle: subtitle,
          picture: picture,
          is_buy: is_buy,
          // ignore: avoid_bool_literals_in_conditional_expressions
          isFavorites: isFavorites,
          priceWithoutDiscount: priceWithoutDiscount,
          discountPrice: discountPrice,
        );

  factory PhoneModel.fromJson(dynamic json) {
    return PhoneModel(
      id: json['id'] as int,
      is_new: json['is_new'],
      title: json['title'] as String,
      subtitle: json['subtitle'],
      picture: json['picture'],
      is_buy: json['is_buy'],
      discountPrice: json['discount_price'],
      priceWithoutDiscount: json['price_without_discount'],
      isFavorites: json['is_favorites'],
    );
  }
  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      isFavorites: map['isFavorites'],
      priceWithoutDiscount: map['priceWithoutDiscount'] as int,
      discountPrice: map['discountPrice'] as int,
      is_new: map['is_new'] as bool,
      subtitle: map['subtitle'] as String,
      is_buy: map['is_buy'] as bool,
      id: map['id'] as int,
      title: map['title'] as String,
      picture: map['picture'],
    );
  }
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['isFavorites'] = isFavorites;
    map['priceWithoutDiscount'] = priceWithoutDiscount;
    map['discountPrice'] = discountPrice;
    map['is_new'] = is_new;
    map['subtitle'] = subtitle;
    map['is_buy'] = is_buy;
    map['id'] = id;
    map['title'] = title;
    map['picture'] = picture;
    return map;
  }
}
