import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/facepage/presentation/widgets/phone_of_face_page.dart';


class CustomFutureBuilderSectionPhoneGallery extends StatelessWidget {
  const CustomFutureBuilderSectionPhoneGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list =
        context.watch<FacePageProvider>().phoneList;

    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 0.57,
        shrinkWrap: true,
        crossAxisCount: 2,
        
        // ignore: avoid_types_on_closure_parameters
        children: (List<PhonesEntity>? list) {
      final listToReturn = List<PhoneOfFacePage>.empty(growable: true);
      list?.forEach((element) {
        listToReturn.add(PhoneOfFacePage(phone: element));
      });
      return listToReturn;
    }(list),);
  }
}

