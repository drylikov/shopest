import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';
import 'package:shopest/features/cart/presentation/widgets/buttonplusmenus.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity item;
  const CartItemWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 89,
                width: 80,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.images),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: SizedBox(
                        width: 120,
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '\$${item.price * item.numberInStack}',
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 110, 78, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ],
          ),
              Row(
                children: [
                  ButtonPlusMinus(idElement: item.id),
                  IconButton(
                    onPressed: () {
                      context
                          .read<CartProvider>()
                          .findExactElementNdelete(item.id);
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/images/trashicon.png'),
                      color: Color.fromRGBO(54, 54, 77, 1),
                    ),
                  ),
                ],
              ),
            
        ],
      ),
    );
  }
}
