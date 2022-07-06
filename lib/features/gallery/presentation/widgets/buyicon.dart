import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class BuyIcon extends StatelessWidget {
  const BuyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GalleryProvider>();
    final phone = model.phoneList![model.indexOfElementToShow!];
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 36,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 110, 78, 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(255, 110, 78, 1),),),
                onPressed: () {},
                child: Text(
                  '${AppLocalizations.of(context)!.addtocart}                        \$${phone.discountPrice}',
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
    );
  }
}
