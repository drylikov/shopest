// ignore_for_file: non_constant_identifier_names, avoid_equals_and_hash_code_on_mutable_classes

import 'dart:ui';

class PhonesEntity {
  final int id;
  final bool? is_new;
  final String title;
  final String? subtitle;
  final String picture;
  final bool? is_buy;
  final bool? isFavorites;
  final int? priceWithoutDiscount;
  final int? discountPrice;

  @override
  int get hashCode => hashValues(id, title);
  PhonesEntity({
    required this.id,
    required this.title,
    required this.picture,
    this.isFavorites,
    this.priceWithoutDiscount,
    this.discountPrice,
    this.is_new,
    this.subtitle,
    this.is_buy,
    
  });

 
  @override
  bool operator ==(Object other) {
    if (runtimeType == other.runtimeType && hashCode == other.hashCode) {
      return true;
    } else {
      return false;
    }
  }

}
