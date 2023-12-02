import '../controller/light_real_estate_details_full_page_controller.dart';
import '../models/autolayouthorizontal6_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';

// ignore: must_be_immutable
class Autolayouthorizontal6ItemWidget extends StatelessWidget {
  Autolayouthorizontal6ItemWidget(
    this.autolayouthorizontal6ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Autolayouthorizontal6ItemModel autolayouthorizontal6ItemModelObj;

  var controller = Get.find<LightRealEstateDetailsFullPageController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Obx(
        () => CustomImageView(
          imagePath: autolayouthorizontal6ItemModelObj.image!.value,
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
