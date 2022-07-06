import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class SelectColorAndOpacity extends StatelessWidget {
  const SelectColorAndOpacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GalleryProvider>();
    return model.describeExist
        ? ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16, bottom: 12),
                  child: Text(
                    AppLocalizations.of(context)!.selectcolorandcapacity,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(1, 0, 53, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 20)),
                        SizedBox(
                          height: 39,
                          width: 39,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              // ignore: avoid_dynamic_calls
                              color: Color(int.parse(model.describe!.color.first
                                  .replaceAll('#', '0xff') as String)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: IconButton(
                              onPressed: () {
                                model.setColor('first');
                              },
                              icon: ImageIcon(
                                const AssetImage(
                                  './assets/images/doneicon.png',
                                ),
                                color: model.selectedColor == 'first'
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 18)),
                        SizedBox(
                          height: 39,
                          width: 39,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),

                              // ignore: avoid_dynamic_calls
                              color: Color(int.parse(model.describe!.color.last
                                  .replaceAll('#', '0xff') as String)),
                            ),
                            child: IconButton(
                              onPressed: () {
                                model.setColor('second');
                              },
                              icon: ImageIcon(
                                const AssetImage(
                                  './assets/images/doneicon.png',
                                ),
                                color: model.selectedColor == 'second'
                                    ? Colors.white
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(left: 32)),
                    Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: model.selectedCapacity == 'first'
                                ? const Color.fromRGBO(255, 110, 78, 1)
                                : Colors.transparent,
                          ),
                          child: SizedBox(
                            height: 31,
                            width: 72,
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(255, 110, 78, 1),
                                ),
                              ),
                              onPressed: () {
                                model.setCapacity('first');
                              },
                              child: Text(
                                '${model.describe!.capacity.first} GB',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: model.selectedCapacity == 'first'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 7)),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: model.selectedCapacity == 'second'
                                ? const Color.fromRGBO(255, 110, 78, 1)
                                : Colors.transparent,
                          ),
                          child: SizedBox(
                            height: 31,
                            width: 72,
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(255, 110, 78, 1),
                                ),
                              ),
                              onPressed: () {
                                model.setCapacity('second');
                              },
                              child: Text(
                                '${model.describe!.capacity.last} GB',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: model.selectedCapacity == 'second'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 7)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : const Text('loading');
  }
}
