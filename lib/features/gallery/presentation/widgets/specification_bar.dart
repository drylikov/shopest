import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class SpecificationBar extends StatelessWidget {
  const SpecificationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<GalleryProvider>();
    return ColoredBox(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const ImageIcon(
                AssetImage('./assets/images/procicon.png'),
                color: Color.fromRGBO(183, 183, 183, 1),
              ),
              if (model.describe != null) Text(
                      model.describe!.cpu.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),
                    ) else const Text(
                      'loading',
                      style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),
                    ),
            ],
          ),
          Column(
            children: [
              const ImageIcon(
                AssetImage('./assets/images/camicon.png', ),
                color: Color.fromRGBO(183, 183, 183, 1),
              ),
              if (model.describe != null) Text(model.describe!.camera.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),) else const Text('loading',
                      style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),),
            ],
          ),
          Column(
            children: [
              const ImageIcon(
                AssetImage('./assets/images/ssdicon.png'),
                color: Color.fromRGBO(183, 183, 183, 1),
              ),
              if (model.describe != null) Text(model.describe!.ssd.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),) else const Text('loading',
                      style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),),
            ],
          ),
          Column(
            children: [
              const ImageIcon(
                AssetImage('./assets/images/sdicon.png'),
                color: Color.fromRGBO(183, 183, 183, 1),
              ),
              if (model.describe != null) Text(model.describe!.sd.toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),) else const Text('loading',
                      style: TextStyle(
                          color: Color.fromRGBO(183, 183, 183, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,),),
            ],
          ),
        ],
      ),
    );
  }
}
