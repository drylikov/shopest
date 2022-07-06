import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextBlockSectionSecond extends StatelessWidget {
  const CustomTextBlockSectionSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(AppLocalizations.of(context)!.bestsellers,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),),),
          Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.seemore,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 110, 78, 1),
                        fontWeight: FontWeight.w400,),
                  ),),),
        ],
      ),
    );
  }
}
