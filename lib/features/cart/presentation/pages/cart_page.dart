import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/cart/domain/entities/cart_entity.dart';
import 'package:shopest/features/cart/domain/usecases/get_cart.dart';
import 'package:shopest/features/cart/presentation/provider/cartprovider.dart';
import 'package:shopest/features/cart/presentation/widgets/appbarsection.dart';
import 'package:shopest/features/cart/presentation/widgets/cartpannel.dart';
import 'package:shopest/service_locator.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    getCart().then((cart) {
      context.read<CartProvider>().setCart(cart!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children:  [
          const AppBarSection(),
          Padding(
            padding: const EdgeInsets.only(bottom: 49, top: 50, left: 42),
            child: Text(
              AppLocalizations.of(context)!.mycart,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
            ),
          ),
          const CartPanel(),
        ],
      ),
    );
  }
  Future<CartEntity?> getCart() async {
    CartEntity? cart;
    final dartz.Either<Failure, CartEntity> failureOrCart =
        await GetCart(sl())();
    failureOrCart.fold(
      (failure) => null,
      (cartEntity) => cart = cartEntity,
    );
    return cart;
  }

  
}
