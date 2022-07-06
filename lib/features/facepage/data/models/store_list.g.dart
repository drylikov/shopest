// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreList _$StoreListFromJson(Map<String, dynamic> json) => StoreList(
      home_store: (json['home_store'] as List<dynamic>?)
          ?.map((e) => PhoneModel.fromJson(e))
          .toList(),
      best_seller: (json['best_seller'] as List<dynamic>?)
          ?.map((e) => PhoneModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$StoreListToJson(StoreList instance) => <String, dynamic>{
      'home_store': instance.home_store,
      'best_seller': instance.best_seller,
    };
