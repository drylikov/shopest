import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 37,
          width: 37,
          child: DecoratedBox(
            
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(1, 0, 53, 1),),
            child: IconButton(
              onPressed: () => {Navigator.pushNamed(context, '/')},
              icon: const ImageIcon(
                AssetImage('./assets/images/backicon.png'),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(AppLocalizations.of(context)!.productdetails,
            style: const TextStyle(
                color: Color.fromRGBO(1, 0, 53, 1),
                fontWeight: FontWeight.w500,),),
        SizedBox(
          height: 37,
          width: 37,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(255, 110, 78, 1),),
            child: IconButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/cart'),
              },
              icon: const ImageIcon(
                AssetImage('./assets/images/sumkaicon.png'),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
