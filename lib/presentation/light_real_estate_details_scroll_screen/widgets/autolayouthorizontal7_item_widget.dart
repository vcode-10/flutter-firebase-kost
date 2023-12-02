import '../controller/light_real_estate_details_scroll_controller.dart';
import '../models/autolayouthorizontal7_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';

// ignore: must_be_immutable
class Autolayouthorizontal7ItemWidget extends StatelessWidget {
  Autolayouthorizontal7ItemWidget(
    this.autolayouthorizontal7ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Autolayouthorizontal7ItemModel autolayouthorizontal7ItemModelObj;

  var controller = Get.find<LightRealEstateDetailsScrollController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Obx(
        () => CustomImageView(
          imagePath: autolayouthorizontal7ItemModelObj.image!.value,
          height: 118.adaptSize,
          width: 118.adaptSize,
          radius: BorderRadius.circular(
            20.h,
          ),
        ),
      ),
    );
  }
}
