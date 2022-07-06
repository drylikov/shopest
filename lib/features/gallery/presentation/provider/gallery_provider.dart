import 'package:flutter/widgets.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/gallery/domain/entity/decribe_entity.dart';

class GalleryProvider extends ChangeNotifier {
  FacePageProvider? model;

  List<PhonesEntity>? phoneList;

  bool selectedPhoneNeedsToShown = false;

  PhonesEntity? phoneToShow;
  int? indexOfElementToShow;

  DescribeEntity? describe;
  bool describeExist = false;

  String selectedCategory = 'Shop';
  String selectedColor = 'first';
   String selectedCapacity = 'first';
  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  
  void setColor(String color) {
    selectedColor = color;
    notifyListeners();
  }

 
  void setCapacity(String capacity) {
    selectedCapacity = capacity;
    notifyListeners();
  }

  void setDescribe(DescribeEntity describeToSet) {
    describe = describeToSet;
    describeExist = true;
    notifyListeners();
  }

  void setExactPhoneAndModel(
      PhonesEntity phone, List<PhonesEntity>? phoneList,) {
    selectedPhoneNeedsToShown = true;
    this.phoneList = phoneList;

    var index = -1;
    var indexCount = 0;
    phoneList?.forEach((element) {
      if (element == phone) {
        index = indexCount;
        return;
      }
      indexCount++;
    });
    indexOfElementToShow = index;
    phoneToShow = phone;
  }

  void setIndexStandartIfNoSpecified() {
    indexOfElementToShow = 0;
  }

  void lowerByOne() {
    indexOfElementToShow = indexOfElementToShow! - 1;
    notifyListeners();
  }

  void upperByOne() {
    indexOfElementToShow = indexOfElementToShow! + 1;
    notifyListeners();
  }

  bool canShowIndexDown() {
    if (indexOfElementToShow! - 1 == -1) {
      return false;
    } else {
      return true;
    }
  }

  bool canShowIndexUp() {
    if (indexOfElementToShow! + 1 == phoneList!.length) {
      return false;
    } else {
      return true;
    }
  }
}
