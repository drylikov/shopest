import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class PhoneOfFacePage extends StatelessWidget {
  final PhonesEntity phone;
  const PhoneOfFacePage({required this.phone, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        //надо подумать вынести это или нет
        context.read<GalleryProvider>().setExactPhoneAndModel(
            phone, context.read<FacePageProvider>().phoneList),
        Navigator.pushNamed(context, '/gallery'),
        //
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          // physics: NeverScrollableScrollPhysics(),

          // itemExtent: 80,
          // shrinkWrap: true,
          children: [
            SizedBox(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ColoredBox(
                    color: Colors.white,
                    child: Image.network(
                      phone.picture,
                      height: 187,
                      width: 168,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          './assets/images/noimage.jpg',
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: const CircleBorder(),
                        fixedSize: const Size(10, 10),
                      ),
                      onPressed: () => {null},
                      child: ImageIcon(
                        AssetImage(
                          // ignore: use_if_null_to_convert_nulls_to_bools
                          phone.isFavorites == true
                              ? './assets/images/hearticonfilled.png'
                              : './assets/images/hearticon.png',
                        ),
                        color: const Color.fromRGBO(255, 110, 78, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    '\$${phone.discountPrice}',
                    style: const TextStyle(
                      color: Color.fromRGBO(1, 0, 53, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(7)),
                  Text(
                    '\$${phone.priceWithoutDiscount}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color.fromRGBO(204, 204, 204, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                phone.title,
                style: const TextStyle(
                  color: Color.fromRGBO(1, 0, 53, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
