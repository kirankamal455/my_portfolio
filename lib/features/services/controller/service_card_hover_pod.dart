import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../data/model/custom_service_card_model.dart';


final serviceCardHoverPod =
    StateProvider.autoDispose.family<bool, String>((ref, key) {
  return false;
});

final serviceDetailsPod =
    StateProvider.autoDispose<List<CustomServiceCardModel>>((ref) {
  return <CustomServiceCardModel>[
    CustomServiceCardModel(
        tittle: "Mobile App Development",
        imagePath: MyAssets.images.serviceImages.mobileApp.path),
    CustomServiceCardModel(
        tittle: "UI/UX Designing",
        imagePath: MyAssets.images.serviceImages.uiUx.path),
    CustomServiceCardModel(
        tittle: "Open source - Github",
        imagePath: MyAssets.images.serviceImages.opensource.path),
    CustomServiceCardModel(
        tittle: "Rapid Prototyping",
        imagePath: MyAssets.images.serviceImages.prototyping.path),
    CustomServiceCardModel(
        tittle: "Rest Apis", imagePath: MyAssets.images.serviceImages.api.path)
  ];
});
