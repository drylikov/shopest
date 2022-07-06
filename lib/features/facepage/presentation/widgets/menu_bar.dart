import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(1, 0, 53, 1),
              borderRadius: BorderRadius.circular(30),),
          // ignore: unnecessary_const
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Padding(padding: EdgeInsets.all(8)),
            Text.rich(
              TextSpan(children: [
                const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: ImageIcon(
                  AssetImage('./assets/images/doticon.png'),
                  color: Colors.white,
                ),),
                TextSpan(
                    text: AppLocalizations.of(context)!.explorer,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.lerp(
                            FontWeight.bold, FontWeight.w700, 1,),),),
              ]),
              textAlign: TextAlign.center,
            ),
            const ImageIcon(
              AssetImage('./assets/images/sumkaicon.png'),
              color: Colors.white,
            ),
            const ImageIcon(
              AssetImage('./assets/images/bighearticon.png'),
              color: Colors.white,
            ),
            const ImageIcon(
              AssetImage('./assets/images/humanicon.png'),
              color: Colors.white,
            ),
            const Padding(padding: EdgeInsets.all(8)),
          ]),),
    );
  }
}
