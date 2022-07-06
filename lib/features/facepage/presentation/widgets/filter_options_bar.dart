// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';

class FilterOptionsBar extends StatefulWidget {
  const FilterOptionsBar({Key? key}) : super(key: key);

  @override
  State<FilterOptionsBar> createState() => _FilterOptionsBarState();
}

class _FilterOptionsBarState extends State<FilterOptionsBar> {
  //изначально список инициирован дефолтными значениями
  Map<String, String> filterOptions = {
    'brand': 'Samsung',
    'price': r'500$-700$',
    'size': '4.5 to 5.5 inches',
  };

  @override
  Widget build(BuildContext context) {
    // если значения уже были, и сохранены, то считываются автоматом
    // если нет, то инициируются дефолтными указанными выше
    if (context.read<FacePageProvider>().filterOptions == null) {
      context.read<FacePageProvider>().filterOptions = filterOptions;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.35,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 12, bottom: 22),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: ElevatedButton(
                    child: const ImageIcon(
                      AssetImage('./assets/images/crossicon.png'),
                    ),
                    onPressed: () {
                      final providerModel = context.read<FacePageProvider>();
                      providerModel.filterOptions = null;
                      providerModel.setShouldShowFilterOptionsFalse();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(1, 0, 53, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Filter options',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    final providerModel =
                        context.read<FacePageProvider>();
                    providerModel.setShouldShowFilterOptionsFalse();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 110, 78, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(6)),
            const Text(
              'Brand',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            DropdownButtonHideUnderline(
              child: SizedBox(
                height: 37,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(220, 220, 220, 1),),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: context
                        .watch<FacePageProvider>()
                        .getCurrentFilterOptions()!['brand'],
                    //value: filterOptions['brand'],
                    onChanged: (valueBrand) => {
                      filterOptions['brand'] = valueBrand!,
                      context
                          .read<FacePageProvider>()
                          .setNewFilterOptions(filterOptions),
                    },
                    items: const [
                      DropdownMenuItem(
                          child: Text(' Samsung'), value: 'Samsung',),
                      DropdownMenuItem(child: Text(' Xiaomi'), value: 'Xiaomi'),
                      DropdownMenuItem(child: Text(' Iphone'), value: 'Iphone'),
                      DropdownMenuItem(
                        child: Text(' Motorola'),
                        value: 'Motorola',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            const Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            DropdownButtonHideUnderline(
              child: SizedBox(
                height: 37,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(220, 220, 220, 1),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton<String>(
                    value: context
                        .watch<FacePageProvider>()
                        .getCurrentFilterOptions()!['price'],
                    onChanged: (valuePrice) => {
                      filterOptions['price'] = valuePrice!,
                      context
                          .read<FacePageProvider>()
                          .setNewFilterOptions(filterOptions),
                    },
                    items: const [
                      DropdownMenuItem(
                        child: Text(r' 300$-500$'),
                        value: r'300$-500$',
                      ),
                      DropdownMenuItem(
                        child: Text(r' 500$-700$'),
                        value: r'500$-700$',
                      ),
                      DropdownMenuItem(
                        child: Text(r' 700$-1200$'),
                        value: r'700$-1200$',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            const Text(
              'Size',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            SizedBox(
              height: 37,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(220, 220, 220, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: context
                        .watch<FacePageProvider>()
                        .getCurrentFilterOptions()!['size'],
                    onChanged: (valueSize) => {
                      filterOptions['size'] = valueSize!,
                      context
                          .read<FacePageProvider>()
                          .setNewFilterOptions(filterOptions),
                    },
                    items: const [
                      DropdownMenuItem(
                        child: Text(' 3.5 to 4.5 inches'),
                        value: '3.5 to 4.5 inches',
                      ),
                      DropdownMenuItem(
                        child: Text(' 4.5 to 5.5 inches'),
                        value: '4.5 to 5.5 inches',
                      ),
                      DropdownMenuItem(
                        child: Text(' 5.5 to 6 inches'),
                        value: '5.5 to 6 inches',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
