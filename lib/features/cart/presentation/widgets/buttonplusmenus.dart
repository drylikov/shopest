import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';

class ButtonPlusMinus extends StatelessWidget {
   final String idElement;
   const ButtonPlusMinus({required this.idElement, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(40, 40, 67, 1),
         borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: SizedBox(
        height: 68,
        width: 26,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 30,
              child: IconButton(
                onPressed: () {
                  context
                      .read<CartProvider>()
                      .changeNubmerInStackOfExactItem(idElement, -1);
                },
                icon: const Icon(Icons.remove,
                size: 16,),
                color: Colors.white,
              ),
            ),
            Positioned(
              child: Text(
                context.watch<CartProvider>().findExactElement(idElement)!.numberInStack.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              top: 30,
              child: IconButton(
                onPressed: () {
                   context
                      .read<CartProvider>()
                      .changeNubmerInStackOfExactItem(idElement, 1);
                },
                icon: const Icon(Icons.add,
                size: 16,),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
