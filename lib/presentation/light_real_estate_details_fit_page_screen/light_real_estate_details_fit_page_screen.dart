import 'controller/light_real_estate_details_fit_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_outlined_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LightRealEstateDetailsFitPageScreen
    extends GetWidget<LightRealEstateDetailsFitPageController> {
  const LightRealEstateDetailsFitPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  _buildMask(),
                  SizedBox(height: 26.v),
                  SizedBox(
                      height: 1375.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.h),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "msg_modernica_apartment".tr,
                                              style: CustomTextStyles
                                                  .headlineLargeGray90001)),
                                      SizedBox(height: 12.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(children: [
                                            CustomElevatedButton(
                                                height: 24.v,
                                                width: 72.h,
                                                text: "lbl_apartment2".tr,
                                                buttonStyle: CustomButtonStyles
                                                    .fillPrimaryTL6,
                                                buttonTextStyle: CustomTextStyles
                                                    .labelMediumPrimarySemiBold),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgIconlyBoldStar10x10,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize,
                                                margin: EdgeInsets.only(
                                                    left: 10.h)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 6.h, top: 2.v),
                                                child: Text(
                                                    "msg_4_8_1_275_reviews".tr,
                                                    style: CustomTextStyles
                                                        .titleMediumGray800SemiBold))
                                          ])),
                                      SizedBox(height: 16.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 40.h),
                                              child: Row(children: [
                                                CustomIconButton(
                                                    height: 40.adaptSize,
                                                    width: 40.adaptSize,
                                                    padding:
                                                        EdgeInsets.all(12.h),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .fillBlueTL20,
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgAutoLayoutHorizontalBlack900)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 11.v,
                                                        bottom: 11.v),
                                                    child: Text("lbl_8_beds".tr,
                                                        style: CustomTextStyles
                                                            .titleSmallGray90001_1)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 24.h),
                                                    child: CustomIconButton(
                                                        height: 40.adaptSize,
                                                        width: 40.adaptSize,
                                                        padding: EdgeInsets.all(
                                                            12.h),
                                                        decoration:
                                                            IconButtonStyleHelper
                                                                .fillBlueTL20,
                                                        child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgFrame40x40))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 11.v,
                                                        bottom: 11.v),
                                                    child: Text("lbl_3_bath".tr,
                                                        style: CustomTextStyles
                                                            .titleSmallGray90001_1)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 24.h),
                                                    child: CustomIconButton(
                                                        height: 40.adaptSize,
                                                        width: 40.adaptSize,
                                                        padding: EdgeInsets.all(
                                                            12.h),
                                                        decoration:
                                                            IconButtonStyleHelper
                                                                .fillBlueTL20,
                                                        child: CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgAutoLayoutHorizontalBlack90040x40))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 12.v,
                                                        bottom: 10.v),
                                                    child: Text(
                                                        "lbl_2000_sqft".tr,
                                                        style: CustomTextStyles
                                                            .titleSmallGray90001_1))
                                              ]))),
                                      SizedBox(height: 24.v),
                                      Divider(),
                                      SizedBox(height: 23.v),
                                      _buildTypeProfileList(),
                                      SizedBox(height: 24.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("lbl_overview".tr,
                                              style: CustomTextStyles
                                                  .titleLargeGray90001)),
                                      SizedBox(height: 13.v),
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
                                      SizedBox(height: 14.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("lbl_facilities".tr,
                                              style: CustomTextStyles
                                                  .titleLargeGray90001)),
                                      SizedBox(height: 27.v),
                                      _buildAutoLayoutHorizontal(),
                                      SizedBox(height: 20.v),
                                      _buildAutoLayoutHorizontal1(),
                                      SizedBox(height: 24.v),
                                      _buildAutoLayoutHorizontal2(),
                                      SizedBox(height: 20.v),
                                      _buildAutoLayoutHorizontal3(),
                                      SizedBox(height: 24.v),
                                      Text("lbl_location".tr,
                                          style: CustomTextStyles
                                              .titleLargeGray90001),
                                      SizedBox(height: 20.v),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 75.h),
                                              child: Row(children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgIconlyBoldLocation,
                                                    height: 20.adaptSize,
                                                    width: 20.adaptSize),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h),
                                                    child: Text(
                                                        "msg_grand_city_st_100"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .titleSmallGray700))
                                              ]))),
                                      SizedBox(height: 20.v),
                                      _buildMask1(),
                                      SizedBox(height: 24.v),
                                      _buildAutoLayoutHorizontal4(),
                                      SizedBox(height: 24.v),
                                      _buildThemeLightCo()
                                    ]))),
                        _buildAutoLayoutHorizontal5()
                      ]))
                ])))));
  }

  /// Section Widget
  Widget _buildMask() {
    return SizedBox(
        height: 416.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage416x428,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomAppBar(
                        height: 28.v,
                        leadingWidth: 52.h,
                        leading: AppbarLeadingImage(
                            imagePath: ImageConstant.imgArrowLeftGray90001,
                            margin: EdgeInsets.only(left: 24.h),
                            onTap: () {
                              onTapArrowLeft();
                            }),
                        actions: [
                          AppbarTrailingImage(
                              imagePath: ImageConstant
                                  .imgIconlyLightOutlineHeartGray90001,
                              margin: EdgeInsets.only(left: 24.h)),
                          AppbarTrailingImage(
                              imagePath: ImageConstant.imgSend,
                              margin: EdgeInsets.only(left: 20.h, right: 24.h))
                        ]),
                    SizedBox(height: 338.v),
                    SizedBox(
                        height: 8.v,
                        child: AnimatedSmoothIndicator(
                            activeIndex: 0,
                            count: 5,
                            effect: ScrollingDotsEffect(
                                spacing: 6,
                                activeDotColor: theme.colorScheme.primary,
                                dotColor: appTheme.gray200,
                                dotHeight: 8.v,
                                dotWidth: 8.h)))
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildTypeProfileList() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomImageView(
          imagePath: ImageConstant.imgEllipse60x60,
          height: 60.adaptSize,
          width: 60.adaptSize,
          radius: BorderRadius.circular(30.h)),
      Padding(
          padding: EdgeInsets.only(left: 20.h, top: 8.v, bottom: 8.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_natasya_wilodra".tr,
                style: CustomTextStyles.titleMediumGray9000118_1),
            SizedBox(height: 4.v),
            Text("lbl_owner".tr, style: CustomTextStyles.titleSmallGray700)
          ])),
      Spacer(),
      CustomImageView(
          imagePath: ImageConstant.imgIconlyLightChat,
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 16.v)),
      CustomImageView(
          imagePath: ImageConstant.imgCall,
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.only(left: 20.h, top: 16.v, bottom: 16.v))
    ]);
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
            SizedBox(height: 8.v),
            Text("lbl_car_parking".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame1)),
            SizedBox(height: 8.v),
            Text("lbl_swimming".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame2)),
            SizedBox(height: 8.v),
            Text("lbl_gym_fitne".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame3)),
            SizedBox(height: 8.v),
            Text("lbl_restaurant".tr,
                textAlign: TextAlign.center,
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
            SizedBox(height: 8.v),
            Text("lbl_wi_fi_ne".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame5)),
            SizedBox(height: 8.v),
            Text("lbl_pet_center".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame6)),
            SizedBox(height: 8.v),
            Text("lbl_sport_center".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame7)),
            SizedBox(height: 8.v),
            Text("lbl_laundry".tr,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallGray800_1)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal2() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("lbl_gallery".tr, style: CustomTextStyles.titleLargeGray90001),
      Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text("lbl_see_all".tr,
              textAlign: TextAlign.right,
              style: CustomTextStyles.titleMediumPrimary))
    ]);
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal3() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomImageView(
          imagePath: ImageConstant.imgImage118x118,
          height: 118.adaptSize,
          width: 118.adaptSize,
          radius: BorderRadius.circular(20.h)),
      CustomImageView(
          imagePath: ImageConstant.imgImage2,
          height: 118.adaptSize,
          width: 118.adaptSize,
          radius: BorderRadius.circular(20.h)),
      SizedBox(
          height: 118.adaptSize,
          width: 118.adaptSize,
          child: Stack(alignment: Alignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgImage3,
                height: 118.adaptSize,
                width: 118.adaptSize,
                radius: BorderRadius.circular(20.h),
                alignment: Alignment.center),
            Align(
                alignment: Alignment.center,
                child: Text("lbl_20".tr,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildMask1() {
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
                  padding: EdgeInsets.only(right: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 16.v, bottom: 1.v),
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
                                left: 25.h, top: 50.v, bottom: 56.v),
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
                            padding: EdgeInsets.only(left: 13.h, bottom: 114.v),
                            child: Text("msg_657_lukken_court".tr,
                                style: CustomTextStyles.bodySmallGray500)),
                        Padding(
                            padding: EdgeInsets.only(left: 21.h, top: 97.v),
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
      Text("lbl_see_all".tr,
          textAlign: TextAlign.right,
          style: CustomTextStyles.titleMediumPrimary)
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
        alignment: Alignment.topCenter,
        child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 320.v, bottom: 935.v),
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

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
