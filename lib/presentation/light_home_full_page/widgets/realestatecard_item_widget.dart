import '../controller/light_home_full_controller.dart';
import '../models/realestatecard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class RealestatecardItemWidget extends StatelessWidget {
  RealestatecardItemWidget(
    this.realestatecardItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RealestatecardItemModel realestatecardItemModelObj;

  var controller = Get.find<LightHomeFullController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.h),
      decoration: AppDecoration.outlineOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 154.adaptSize,
            width: 154.adaptSize,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: realestatecardItemModelObj.userImage!.value,
                    height: 154.adaptSize,
                    width: 154.adaptSize,
                    radius: BorderRadius.circular(
                      20.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                CustomElevatedButton(
                  height: 22.v,
                  width: 100.h,
                  text: "Tersedia".tr,
                  margin: EdgeInsets.only(
                    top: 12.v,
                    right: 12.h,
                  ),
                  // buttonTextStyle: theme.textTheme.labelMedium!,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
          SizedBox(height: 11.v),
          Obx(
            () => Text(
              realestatecardItemModelObj.realEstateName!.value,
              style: CustomTextStyles.titleMediumGray9000118_1,
            ),
          ),
          SizedBox(height: 12.v),
          Obx(
            () => Text(
              realestatecardItemModelObj.cityCountry!.value,
              style: CustomTextStyles.labelMediumGray700,
            ),
          ),
          SizedBox(height: 8.v),
          Row(
            children: [
              Obx(
                () => Text(
                  realestatecardItemModelObj.price!.value,
                  style: CustomTextStyles.titleLargePrimary,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 10.v,
                  bottom: 2.v,
                ),
                child: Obx(
                  () => Text(
                    realestatecardItemModelObj.priceUnit!.value,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIconlyLightOutlineHeart,
                height: 20.adaptSize,
                width: 20.adaptSize,
                margin: EdgeInsets.only(
                  left: 67.h,
                  bottom: 2.v,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
