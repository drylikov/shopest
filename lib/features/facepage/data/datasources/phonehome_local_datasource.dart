import 'package:shopest/core/db/database.dart';
import 'package:shopest/core/db/database_shemas.dart';
import 'package:shopest/features/facepage/data/models/phone_model.dart';

abstract class PhoneHomeLocalSource {
  Future<List<PhoneModel>?> getHomeStorePhones();
  Future<List<PhoneModel>> getPhonesHomeOfUser(String identificatorOfUser);

  void casheHomeStorePhones(Map<String, dynamic> phoneHomeToCashe);
}

class PhoneHomeLocalSourceImpl extends PhoneHomeLocalSource {
  String phoneHomeTable = 'phoneHomeTable';
  String phoneHomeTableCommand = '''
CREATE TABLE IF NOT EXISTS phoneHomeTable (
    isFavorites BIT,
    priceWithoutDiscount INTEGER,
    discountPrice INTEGER,
    isNew BIT,
    subtitle TEXT,
    isBuy BIT,
    id INTEGER,
    title TEXT,
    picture TEXT
  )''';
  DBProvider db = DBProvider();
  PhoneHomeLocalSourceImpl() {
    DataBaseShemas.shemas.add(phoneHomeTableCommand);
  }



  @override
  Future<List<PhoneModel>?> getHomeStorePhones() async {
    final list = await db.getTable(phoneHomeTable);
    if (list.isEmpty) {
      return null;
    }
    final listObect = List<PhoneModel>.empty(growable: true);
    for (final map in list) {
      listObect.add(PhoneModel.fromMap(map));
    }
    return listObect;
  }

  @override
  Future<void> casheHomeStorePhones(Map<String, dynamic> phoneHomeToCashe) async {
    final count = await db.count(phoneHomeTable);
    if (count.first['count(*)'] as int > 4) {
      await db.deleteTablesInside(phoneHomeTable);
    }
    if (count.first['count(*)'] as int == 0) {
      await db.insert(phoneHomeTable, phoneHomeToCashe);
    }
  }

  @override
  Future<List<PhoneModel>> getPhonesHomeOfUser(String identificatorOfUser) {
    throw UnimplementedError();
  }
}
