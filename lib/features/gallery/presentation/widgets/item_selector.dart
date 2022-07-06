import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopest/features/gallery/presentation/provider/gallery_provider.dart';

class ItemSelector extends StatelessWidget {
  const ItemSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<GalleryProvider>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (model.selectedPhoneNeedsToShown == false) {
      model.setIndexStandartIfNoSpecified();
    }
    final index = context.watch<GalleryProvider>().indexOfElementToShow!;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // h 220 w 140 index -1

        Positioned(
          left: 250,
          child: GestureDetector(
            onTap: model.lowerByOne,
            child: model.canShowIndexDown()
                ? DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                      
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      boxShadow: [
                       BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                            // changes position of shadow
                          ),
                        
                      ],
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: DecoratedBox(
                     position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      child: SizedBox(
                          height: height / 4.5,
                          width: width / 2.8,
                          child: FittedBox(
                             fit: BoxFit.fill,
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              model.phoneList![index - 1].picture,
                              errorBuilder: ((context, error, stackTrace) =>
                                  Image.asset(
                                      './assets/images/noimage.jpg')),
                            ),
                          ),
                        ),
                    ),
                  ),
                )
                : SizedBox(
                    height: height / 5,
                    width: width / 2.8,
                  ),
          ),
        ),
        // h 240 w 220 index 0
       Positioned(
          right: 250,
          child: GestureDetector(
            onTap: model.upperByOne,
            child: model.canShowIndexUp()
                ? DecoratedBox(
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                      
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                          // changes position of shadow
                        ),
                      ],
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: SizedBox(
                        height: height / 4.5,
                        width: width / 2.8,
                        child: DecoratedBox(
                          position: DecorationPosition.foreground,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              model.phoneList![index + 1].picture,
                              errorBuilder: ((context, error, stackTrace) =>
                                  Image.asset(
                                      './assets/images/noimage.jpg', fit: BoxFit.fill,)),
                            ),
                          ),
                        ),
                      ),
                  ),
                )
                : SizedBox(
                    height: height / 5,
                    width: width / 2.8,
                  ),
          ),
        ),
        // h 220 w 140 + index 1
        Positioned(
         
          child: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                        // changes position of shadow
                      ),
                    ],
                  ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FittedBox(
                       fit: BoxFit.fill,
                            clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                       height: height / 3.2,
                         width: width / 1.6,
                        child: DecoratedBox(
                          
                          position: DecorationPosition.foreground,
                          decoration: BoxDecoration(
                            
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          child: FittedBox(
                             fit: BoxFit.fill,
                              clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              model.phoneList![index].picture,
                              errorBuilder: ((context, error, stackTrace) =>
                                  Image.asset(
                                      './assets/images/noimage.jpg', fit: BoxFit.fill,)),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
              
        ),
      ],
    );
  }
}
