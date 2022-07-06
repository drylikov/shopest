import 'package:shopest/core/db/database.dart';

import 'package:shopest/features/gallery/data/models/describe.dart';

abstract class DescribeLocalDataSource {
  Future<DescribeModel?> getDescribe();
  Future<DescribeModel> getDescribeOfExactPhone(String id);

  void casheDescribe(Map<String, dynamic> map);
}

class DescribeLocalDataSourceImpl extends DescribeLocalDataSource {
  String describeTable = 'describeTable';
  String describeTableCommand = '''
CREATE TABLE IF NOT EXISTS describeTable (
          cpu TEXT,
          camera TEXT,
          capacity TEXT,
          color TEXT,
          id INTEGER,
          images TEXT,
          isFavourtites BIT,
          price INTEGER,
          rating INTEGER,
          sd TEXT,
          ssd TEXT,
          title TEXT)
  ''';
  DBProvider db = DBProvider();
  DescribeLocalDataSourceImpl() {
    db.exec(describeTableCommand);
  }

  

  @override
  Future<DescribeModel?> getDescribe() async {
    DescribeModel? describeModel;

    final describe = await db.getTable(describeTable);

    if (describe.isEmpty) {
      return null;
    }

    describeModel = DescribeModel.fromMap(describe.first);

    return describeModel;
  }

  @override
  Future<DescribeModel> getDescribeOfExactPhone(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> casheDescribe(Map<String, dynamic> map) async {
    final count = await db.count(describeTable);
    if (count.first['count(*)'] as int > 1) {
      await db.deleteTablesInside(describeTable);
    }
    if (count.first['count(*)'] as int == 0) {
      await db.insert(describeTable, map);
    }
  }
}
