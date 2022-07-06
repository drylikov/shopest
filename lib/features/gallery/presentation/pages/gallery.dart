import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/core/error/failure.dart';
import 'package:shopest/features/gallery/domain/entity/decribe_entity.dart';
import 'package:shopest/features/gallery/domain/usecases/get_describe.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';
import 'package:shopest/features/gallery/presentation/widgets/appbar_section.dart';
import 'package:shopest/features/gallery/presentation/widgets/buyicon.dart';
import 'package:shopest/features/gallery/presentation/widgets/item_selector.dart';
import 'package:shopest/features/gallery/presentation/widgets/menu_selector.dart';
import 'package:shopest/features/gallery/presentation/widgets/name_stars_button.dart';
import 'package:shopest/features/gallery/presentation/widgets/select_color_and_opacity.dart';
import 'package:shopest/features/gallery/presentation/widgets/specification_bar.dart';
import 'package:shopest/service_locator.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  void initState() {
    // здесь по идее нужно тянуть описание телефона на первой итерации
    getDesctibe().then((describe) {
      context.read<GalleryProvider>().setDescribe(describe!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Padding(
          padding: EdgeInsets.only(top: 32.0),
          child: AppBarSection(),
        ),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 11),
            child: ListView(
              shrinkWrap: true,
              children:const [ ItemSelector()],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              NameStarsButton(),
              MenuSelector(),
              SpecificationBar(),
              SelectColorAndOpacity(),
              BuyIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Future<DescribeEntity?> getDesctibe() async {
    DescribeEntity? descr;

    final dartz.Either<Failure, DescribeEntity> failureOrDescribe =
        await GetDescribe(sl())();
    failureOrDescribe.fold((error) => null, (describe) => descr = describe);
    return descr;
  }
}
