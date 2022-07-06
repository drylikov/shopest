import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/facepage/domain/entity/phones_entity.dart';
import 'package:shopest/features/facepage/domain/usecases/phone_usecase.dart';
import 'package:shopest/features/facepage/presentation/provider/face_page_provider.dart';
import 'package:shopest/features/facepage/presentation/widgets/c0ustom_text_block_section_second.dart';
import 'package:shopest/features/facepage/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:shopest/features/facepage/presentation/widgets/custom_search_textfield.dart';
import 'package:shopest/features/facepage/presentation/widgets/custom_text_block.dart';
import 'package:shopest/features/facepage/presentation/widgets/filter_options_bar.dart';
import 'package:shopest/features/facepage/presentation/widgets/future_builder_section_phone_gallery.dart';
import 'package:shopest/features/facepage/presentation/widgets/location_message.dart';
import 'package:shopest/features/facepage/presentation/widgets/menu_bar.dart';
import 'package:shopest/features/facepage/presentation/widgets/select_category_button_bar.dart';
import 'package:shopest/service_locator.dart';

class FacePage extends StatefulWidget {
  const FacePage({Key? key}) : super(key: key);

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  @override
  void initState() {
    super.initState();
    //firebase

    getListSinglePhoneHomeStore()
        ?.then((list) => context.read<FacePageProvider>().setPhoneList(list));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: context.watch<FacePageProvider>().shouldShowFilterOptions
          ? const FilterOptionsBar()
          : const MenuBar(),
      body: ListView(
        shrinkWrap: true,
        primary: true,
        padding: const EdgeInsets.only(
          bottom: 100,
          left: 15,
          right: 21,
          top: 32,
        ),
        children: [
          const LocationMessage(),
          const CustomSelectCategoryButtonBar(),
          const CustomSearchTextField(),
          const CustomTextBlockSectionFirst(),
          Image.asset('./assets/images/imagestore.png'),
          const CustomTextBlockSectionSecond(),
          if (context.watch<FacePageProvider>().isPhoneListCreated)
            const CustomFutureBuilderSectionPhoneGallery()
          else
            const CustomCircularProgressIndicator(),
        ],
      ),
    );
  }

  Future<List<PhonesEntity>>? getListSinglePhoneHomeStore() async {
    List<PhonesEntity>? list;
    final failureOrResult = await GetHomeStorePhones(sl())();
    failureOrResult.fold(
      (failure) => null,
      (phonesHome) => list = phonesHome,
    );
    return list!;
  }
}
