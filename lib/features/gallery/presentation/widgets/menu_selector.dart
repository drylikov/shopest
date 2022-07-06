import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class MenuSelector extends StatelessWidget {
  const MenuSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GalleryProvider>();

    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: SizedBox(
        height: 48,
        child: ColoredBox(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 1
              TextButton(
                onPressed: () {
                  model.setCategory('Shop');
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 110, 78, 1),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  decoration: model.selectedCategory == 'Shop'
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 110, 78, 1),
                              width: 2.0,
                            ),
                          ),
                        )
                      : const BoxDecoration(),
                  child: Text(
                    AppLocalizations.of(context)!.shop,
                    style: model.selectedCategory == 'Shop'
                        ? const TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontWeight: FontWeight.w700,
                          )
                        : const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ),
              ),
              // 2
              TextButton(
                onPressed: () {
                  model.setCategory('Details');
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 110, 78, 1),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  decoration: model.selectedCategory == 'Details'
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 110, 78, 1),
                              width: 2.0, // Underline thickness
                            ),
                          ),
                        )
                      : const BoxDecoration(),
                  child: Text(
                    AppLocalizations.of(context)!.details,
                    style: model.selectedCategory == 'Details'
                        ? const TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontWeight: FontWeight.w700,
                          )
                        : const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ),
              ),
              // 3
              TextButton(
                onPressed: () {
                  model.setCategory('Features');
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 110, 78, 1),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  decoration: model.selectedCategory == 'Features'
                      ? const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(255, 110, 78, 1),
                              width: 2.0, // Underline thickness
                            ),
                          ),
                        )
                      : const BoxDecoration(),
                  child: Text(
                    AppLocalizations.of(context)!.features,
                    style: model.selectedCategory == 'Features'
                        ? const TextStyle(
                            color: Color.fromRGBO(1, 0, 53, 1),
                            fontWeight: FontWeight.w700,
                          )
                        : const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
