import '../light_real_estate_details_scroll_screen/widgets/autolayouthorizontal7_item_widget.dart';
import 'controller/light_real_estate_details_scroll_controller.dart';
import 'models/autolayouthorizontal7_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_outlined_button.dart';

class LightRealEstateDetailsScrollScreen
    extends GetWidget<LightRealEstateDetailsScrollController> {
  const LightRealEstateDetailsScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 882.v,
                        width: double.maxFinite,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.h),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            width: 372.h,
                                            margin: EdgeInsets.only(right: 7.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "msg_lorem_ipsum_dolor2"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .titleMediumGray800),
                                                  TextSpan(
                                                      text: "lbl_read_more".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumPrimaryMedium_1)
                                                ]),
                                                textAlign: TextAlign.left)),
                                        SizedBox(height: 8.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_facilities".tr,
                                                style: CustomTextStyles
                                                    .titleLargeGray90001)),
                                        SizedBox(height: 20.v),
                                        _buildAutoLayoutHorizontal(),
                                        SizedBox(height: 19.v),
                                        _buildAutoLayoutHorizontal1(),
                                        SizedBox(height: 24.v),
                                        _buildAutoLayoutHorizontal2(),
                                        SizedBox(height: 18.v),
                                        _buildAutoLayoutHorizontal3(),
                                        SizedBox(height: 24.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("lbl_location".tr,
                                                style: CustomTextStyles
                                                    .titleLargeGray90001)),
                                        SizedBox(height: 19.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 75.h),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgIconlyBoldLocation,
                                                      height: 20.adaptSize,
                                                      width: 20.adaptSize),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h, top: 3.v),
                                                      child: Text(
                                                          "msg_grand_city_st_100"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleSmallGray700))
                                                ]))),
                                        SizedBox(height: 20.v),
                                        _buildMask(),
                                        SizedBox(height: 24.v),
                                        _buildAutoLayoutHorizontal4(),
                                        SizedBox(height: 23.v),
                                        _buildThemeLightCo()
                                      ]))),
                          _buildAutoLayoutHorizontal5(),
                          _buildAppBar()
                        ]))))));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal() {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 8.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame60x60)),
            SizedBox(height: 11.v),
            Text("lbl_car_parking".tr,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame1)),
            SizedBox(height: 11.v),
            Text("lbl_swimming".tr, style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame2)),
            SizedBox(height: 11.v),
            Text("lbl_gym_fitne".tr,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame3)),
            SizedBox(height: 9.v),
            Text("lbl_restaurant".tr,
                style: CustomTextStyles.titleSmallGray800_1)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal1() {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 14.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame4)),
            SizedBox(height: 9.v),
            Text("lbl_wi_fi_ne".tr, style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame5)),
            SizedBox(height: 9.v),
            Text("lbl_pet_center".tr,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame6)),
            SizedBox(height: 11.v),
            Text("lbl_sport_center".tr,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame7)),
            SizedBox(height: 11.v),
            Text("lbl_laundry".tr, style: CustomTextStyles.titleSmallGray800_1)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal2() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("lbl_gallery".tr, style: CustomTextStyles.titleLargeGray90001),
      Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text("lbl_see_all".tr,
              style: CustomTextStyles.titleMediumPrimary))
    ]);
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal3() {
    return SizedBox(
        height: 118.v,
        child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 13.h);
            },
            itemCount: controller.lightRealEstateDetailsScrollModelObj.value
                .autolayouthorizontal7ItemList.value.length,
            itemBuilder: (context, index) {
              Autolayouthorizontal7ItemModel model = controller
                  .lightRealEstateDetailsScrollModelObj
                  .value
                  .autolayouthorizontal7ItemList
                  .value[index];
              return Autolayouthorizontal7ItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildMask() {
    return SizedBox(
        height: 200.v,
        width: 380.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: AppDecoration.fillBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgVectorWhiteA700,
                      height: 200.v,
                      width: 380.h,
                      radius: BorderRadius.circular(24.h)))),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 14.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 16.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("msg_488_farwell_road".tr,
                                      style: CustomTextStyles.bodySmallGray500),
                                  SizedBox(height: 98.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("msg_9_evergreen_center".tr,
                                          style: CustomTextStyles
                                              .bodySmallGray500))
                                ])),
                        Container(
                            margin: EdgeInsets.only(
                                left: 26.h, top: 49.v, bottom: 57.v),
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusStyle.roundedBorder24,
                                image: DecorationImage(
                                    image:
                                        AssetImage(ImageConstant.imgGroup61x52),
                                    fit: BoxFit.cover)),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 6.v),
                                  Container(
                                      height: 32.adaptSize,
                                      width: 32.adaptSize,
                                      decoration: AppDecoration.outlineWhiteA
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16),
                                      child: CustomImageView(
                                          imagePath:
                                              ImageConstant.imgEllipse32x32,
                                          height: 32.adaptSize,
                                          width: 32.adaptSize,
                                          radius: BorderRadius.circular(16.h),
                                          alignment: Alignment.center))
                                ])),
                        Padding(
                            padding: EdgeInsets.only(left: 14.h, bottom: 115.v),
                            child: Text("msg_657_lukken_court".tr,
                                style: CustomTextStyles.bodySmallGray500)),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, top: 96.v),
                            child: Text("msg_59797_elka_trail".tr,
                                style: CustomTextStyles.bodySmallGray500))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal4() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgIconlyBoldStar10x10,
          height: 24.adaptSize,
          width: 24.adaptSize),
      Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text("msg_4_8_1_275_reviews".tr,
              style: CustomTextStyles.titleLargeGray800)),
      Spacer(),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text("lbl_see_all".tr,
              style: CustomTextStyles.titleMediumPrimary))
    ]);
  }

  /// Section Widget
  Widget _buildThemeLightCo() {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomImageView(
                imagePath: ImageConstant.imgProfile,
                height: 48.adaptSize,
                width: 48.adaptSize),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 13.v),
                child: Text("msg_charolette_hanlin".tr,
                    style: CustomTextStyles.titleMediumGray90001_1)),
            CustomOutlinedButton(
                width: 60.h,
                text: "lbl_5".tr,
                margin: EdgeInsets.symmetric(vertical: 8.v),
                leftIcon: Container(
                    margin: EdgeInsets.only(right: 8.h),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgIconlyBoldStar,
                        height: 12.adaptSize,
                        width: 12.adaptSize))),
            CustomImageView(
                imagePath: ImageConstant.imgIconlyLightMore,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 12.v))
          ]),
          SizedBox(height: 12.v),
          SizedBox(
              width: 380.h,
              child: Text("msg_the_apartment_is".tr,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray90001
                      .copyWith(height: 1.40))),
          SizedBox(height: 12.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgIconlyLightHeart,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 8.h, top: 5.v, bottom: 5.v),
                    child: Text("lbl_938".tr,
                        style: CustomTextStyles.labelLargeGray90001)),
                Padding(
                    padding: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 5.v),
                    child: Text("lbl_6_days_ago".tr,
                        style: CustomTextStyles.labelLargeGray700))
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal5() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 763.v),
            padding: EdgeInsets.symmetric(vertical: 24.v),
            decoration: AppDecoration.outlineGray1002
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL36),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 11.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_price".tr,
                                style: CustomTextStyles.labelMediumGray700),
                            SizedBox(height: 6.v),
                            SizedBox(
                                width: 104.h,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("lbl_29".tr,
                                          style: CustomTextStyles
                                              .headlineLargePrimary),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 17.v, bottom: 4.v),
                                          child: Text("lbl_night".tr,
                                              style: CustomTextStyles
                                                  .titleSmallGray700))
                                    ]))
                          ])),
                  CustomElevatedButton(
                      width: 256.h,
                      text: "lbl_booking_now".tr,
                      margin: EdgeInsets.only(bottom: 11.v),
                      buttonStyle: CustomButtonStyles.outlinePrimary)
                ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 54.v,
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftGray90001,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIconlyLightOutlineHeartGray90001,
              margin: EdgeInsets.only(left: 24.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSend,
              margin: EdgeInsets.only(left: 20.h, right: 24.h))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
