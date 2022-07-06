// ignore_for_file: avoid_dynamic_calls

import 'package:shopest/features/gallery/domain/entity/decribe_entity.dart';

class DescribeModel extends DescribeEntity {
  DescribeModel({
    required String cpu,
    required String camera,
    required List<dynamic> capacity,
    required List<dynamic> color,
    required String id,
    required List<dynamic> images,
    required bool isFavourtites,
    required int price,
    required double rating,
    required String sd,
    required String ssd,
    required String title,
  }) : super(
          cpu: cpu,
          camera: camera,
          //
          capacity: capacity,
          color: color,
          //
          id: id,
          images: images,
          isFavourtites: isFavourtites,
          price: price,
          rating: rating,
          sd: sd,
          ssd: ssd,
          title: title,
        );

  // ignore: avoid_annotating_with_dynamic
  factory DescribeModel.fromJson(dynamic json) {
    return DescribeModel(
        cpu: json['CPU'] as String,
        camera: json['camera'] as String,
        capacity: json['capacity'] as List<dynamic>,
        color: json['color'] as List<dynamic>,
        id: json['id'] as String,
        images: json['images'] as List<dynamic>,
        isFavourtites: json['isFavorites'] as bool,
        price: json['price'] as int,
        rating: json['rating'] as double,
        sd: json['sd'] as String,
        ssd: json['ssd'] as String,
        title: json['title'] as String,);
  }

  factory DescribeModel.fromMap(Map<String, dynamic> map) {
    final capacity = List<dynamic>.empty(growable: true);
    final color = List<dynamic>.empty(growable: true);
    final imagesToReturn = List<dynamic>.empty(growable: true);

    final strCapacity = map['capacity'] as String;
    final strColor = map['color'] as String;
    final strImages = map['images'] as String;

    strCapacity.split(', ').forEach((element) {
      capacity.add(int.parse(element));
    });
    strColor.split(', ').forEach(color.add);
    strImages.split(', ').forEach(imagesToReturn.add);

    return DescribeModel(
        cpu: map['cpu'] as String,
        camera: map['camera'] as String,
        capacity: capacity,
        color: color,
        id: map['id'].toString(),
        images: imagesToReturn,
        // ignore: avoid_bool_literals_in_conditional_expressions
        isFavourtites: map['isFavourtites'] == 1 ? true : false,
        price: map['price'] as int,
        rating: map['rating'] as double,
        sd: map['sd'] as String,
        ssd: map['ssd'] as String,
        title: map['title'] as String,);
  }

  Map<String, dynamic> toMap() {
    // images !!
    // ifFavourites !!

    final map = <String, dynamic>{};

    final strCapacity = List<String>.empty(growable: true);
    final strColor = List<String>.empty(growable: true);
    final strImages = List<String>.empty(growable: true);

    String colorToReturn;
    String capacityToReturn;
    String imagesToReturn;

    for (final element in color) {
      strColor.add(element.toString());
    }
    colorToReturn = strColor.join(', ');

    for (final element in capacity) {
      strCapacity.add(element.toString());
    }
    capacityToReturn = strCapacity.join(', ');
    for (final element in images) {
      strImages.add(element.toString());
    }
    imagesToReturn = strImages.join(', ');

    map['cpu'] = cpu;
    map['camera'] = camera;
    map['capacity'] = capacityToReturn;
    map['color'] = colorToReturn;
    map['id'] = id;
    map['images'] = imagesToReturn;
    map['isFavourtites'] = isFavourtites == true ? 1 : 0;
    map['price'] = price;
    map['rating'] = rating;
    map['sd'] = sd;
    map['ssd'] = ssd;
    map['title'] = title;
    return map;
  }
}
