// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:shopest/features/facepage/data/models/phone_model.dart';

part 'store_list.g.dart';

@JsonSerializable()
class StoreList {
  List<PhoneModel>? home_store;
  List<PhoneModel>? best_seller;
StoreList({this.home_store, this.best_seller});


   factory StoreList.fromJson(Map<String, dynamic> json) => _$StoreListFromJson(json);
     Map<String, dynamic> toJson() => _$StoreListToJson(this);


}
