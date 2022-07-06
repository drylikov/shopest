import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          constraints: BoxConstraints.loose(const Size.fromWidth(200)),
          child: SizedBox(
            height: 34,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(50),),
              child: TextFormField(
                cursorHeight: 18,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 4),
                    constraints: const BoxConstraints(maxHeight: 34),
                    hintText: AppLocalizations.of(context)!.search,
                    prefixIcon: const ImageIcon(
                      AssetImage('./assets/images/searchicon.png'),
                      color: Color.fromRGBO(255, 110, 78, 1),
                    ),
                    border: InputBorder.none,),
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: const ImageIcon(AssetImage('./assets/images/qricon.png')),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(255, 110, 78, 1),
            shape: const CircleBorder(),
          ),
        ),
      ],
    );
  }
}
