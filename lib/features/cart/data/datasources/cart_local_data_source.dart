import 'package:shopest/core/db/database.dart';
import 'package:shopest/core/db/database_shemas.dart';
import 'package:shopest/features/cart/data/models/cart_item_model.dart';
import 'package:shopest/features/cart/data/models/cart_model.dart';

abstract class CartLocalDataSource {
  Future<CartModel?> getCart(List<CartItemModel?> listCartItem);
  Future<List<CartItemModel?>> getCartItems();

  void casheCart(Map<String, dynamic> cartToCashe);
  void casheCartItems(Map<String, dynamic> cartItemsToCashe);
}

class CartLocalDataSourceImpl extends CartLocalDataSource {
  String cartTable = 'cartTable';
  String cartItemsTable = 'cartItemsTable';

  String createcartTableCommand = '''
CREATE TABLE IF NOT EXISTS cartTable (
    delivery TEXT,
    id TEXT,
    total INTEGER
  )''';
  String createcartItemsTableCommand =
      '''
CREATE TABLE IF NOT EXISTS cartItemsTable (
    id TEXT,
    images TEXT,
    price INTEGER,
    title TEXT
  )''';

  CartLocalDataSourceImpl() {
    DataBaseShemas.shemas.add(createcartTableCommand);
    DataBaseShemas.shemas.add(createcartItemsTableCommand);
  }

  DBProvider db = DBProvider();

  @override
  Future<CartModel> getCart(listCartItem) async {
    List<Map<String, Object?>> list = await db.getTable(cartTable);
    return CartModel.fromMap(list.first, await getCartItems());
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    List<CartItemModel> listToReturn = List.empty(growable: true);
    List<Map<String, Object?>> list = await db.getTable(cartItemsTable);
    for (var element in list) {
      listToReturn.add(CartItemModel.fromMap(element));
    }
    return listToReturn;
  }

  @override
  void casheCart(Map<String, dynamic> cartToCashe) async {
    List<Map<String, Object?>> count = await db.count(cartTable);
    if (count.first['count(*)'] as int > 1) {
      await db.deleteTablesInside(cartTable);
    }
    if (count.first['count(*)'] as int == 0) {
      await db.insert(cartTable, cartToCashe);
    }
  }

  @override
  void casheCartItems(Map<String, dynamic> cartItemsToCashe) async {
    List<Map<String, Object?>> count = await db.count(cartItemsTable);
    if (count.first['count(*)'] as int > 2) {
      await db.deleteTablesInside(cartItemsTable);
    }
    if (count.first['count(*)'] as int == 0) {
      await db.insert(cartItemsTable, cartItemsToCashe);
    }
  }
}
