import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';
import 'package:shopest/features/cart/presentation/widgets/cart_item_widget.dart';

class CartPanel extends StatelessWidget {
  const CartPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartProvider>();
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(1, 0, 53, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 50,
        child: model.cartExist
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 23, top: 23),
                    // ignore: avoid_types_on_closure_parameters
                    children: (BuildContext context) {
                      final list = List<CartItemWidget>.empty(growable: true);
                      final listCartItem =
                          context.watch<CartProvider>().cart!.basket;
                      for (final cartInfo in listCartItem) {
                        list.add(CartItemWidget(item: cartInfo));
                      }
                      return list;
                    }(context),
                  ),
                  //придумать во что взять потом
                  SizedBox(
                    height: 345,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Divider(
                            color: Color.fromRGBO(255, 255, 255, 0.25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 52.0, right: 52.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.total,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                '\$${model.total} us',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 52.0, right: 52.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.delivery,
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                model.cart!.delivery,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Divider(
                            color: Color.fromRGBO(255, 255, 255, 0.2),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 58),
                          child: Center(
                            child: SizedBox(
                              width: 285,
                              height: 36,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 110, 78, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(
                                        255,
                                        110,
                                        78,
                                        1,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    AppLocalizations.of(context)!.checkout,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator(color: Colors.orange,)),
      ),
    );
  }
}
