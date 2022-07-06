import 'package:flutter/foundation.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';

class FacePageProvider extends ChangeNotifier {
  // Список телефонов которые мы получили из гета
  List<PhonesEntity>? phoneList;
  // Опции фильтра для списка телефонов если  не инициирован, то фильтр не применяется и список опций пуст
  Map<String, String>? filterOptions;

  bool isPhoneListCreated = false;
  bool shouldShowFilterOptions = false;

  void setPhoneList(List<PhonesEntity> list) {
    phoneList = list;
    isPhoneListCreated = true;
    notifyListeners();
  }

  Map<String, String>? getCurrentFilterOptions() {
    return filterOptions;
  }

  void setNewFilterOptions(Map<String, String> newOptions) {
    filterOptions = newOptions;
    notifyListeners();
  }

  void setShouldShowFilterOptionsTrue() {
    shouldShowFilterOptions = true;
    notifyListeners();
  }

  void setShouldShowFilterOptionsFalse() {
    shouldShowFilterOptions = false;
    notifyListeners();
  }
  
}
