import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

class NameStarsButton extends StatelessWidget {
  const NameStarsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GalleryProvider>();
    final phone = model.phoneList![model.indexOfElementToShow!];

    return SizedBox(
      height: 59,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 22,
                offset: const Offset(0, -16),
                // changes position of shadow
              ),
            ],),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 12, top: 8,),
          child: Wrap(spacing: -20, runSpacing: -6, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // единственное, что не тянется из getDescr
                Text(
                  phone.title,
                  style: const TextStyle(
                      color: Color.fromRGBO(1, 0, 53, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,),
                ),

                SizedBox(
                  height: 38,
                  width: 38,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(1, 0, 53, 1),),
                    child: IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage('./assets/images/hearticon.png'),
                          color: Colors.white,
                        ),),
                  ),
                ),
              ],
            ),
            if (model.describeExist) SmoothStarRating(
                    onRatingChanged: (v) {},
                    rating: model.describe!.rating,
                    size: 16.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    color: const Color.fromRGBO(255, 184, 0, 1),
                    borderColor: Colors.white,
                    spacing: 2.0,) else Container(),
          ]),
        ),
      ),
    );
  }
}
