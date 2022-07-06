import 'package:flutter/widgets.dart';
import 'package:shopest/features/cart/domain/entities/cart_entity.dart';
import 'package:shopest/features/cart/domain/entities/cart_item_entity.dart';

class CartProvider extends ChangeNotifier {
  CartEntity? cart;
  List<CartItemEntity>? cartList;
  bool cartExist = false;

  int total = 0;

  void setCart(CartEntity c) {
    cart = c;
    cartList = c.basket;
    cartExist = true;
    notifyListeners();
  }

  void changeNubmerInStackOfExactItem(String idElement, int number) {
    cartList?.forEach((element) {
      if (element.id == idElement) {
        if (element.numberInStack + number >= 0) {
          element.numberInStack = element.numberInStack + number;
        } else {
          // пропускаем, нельзя заказать отрицательное количество
        }
      }
    });
    countTotal();
    notifyListeners();
  }

  CartItemEntity? findExactElement(String idElement) {
    CartItemEntity? elem;
    cartList?.forEach((element) {
      if (element.id == idElement) {
        elem = element;
      }
    });
    return elem;
  }

  void findExactElementNdelete(String idElementToDelete) {
    CartItemEntity? itemToDelete;
    cartList?.forEach((element) {
      if (element.id == idElementToDelete) {
        itemToDelete = element;
      }
    });
    cartList?.remove(itemToDelete);
    countTotal();
    notifyListeners();
  }

  void countTotal() {
    total = 0;
    cartList?.forEach((element) {
      total = total + element.price * element.numberInStack;
    });
  }
}
