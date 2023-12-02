import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/image_constant.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/theme/custom_button_style.dart';
import 'package:projectkost/theme/custom_text_style.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_image_view.dart';
import 'package:projectkost/widgets/custom_outlined_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  final user = FirebaseAuth.instance.currentUser;
  var username;
  var urlImageProfile;
  var nameKontrakan;
  var alamatKontrakan;
  var diSewakan;
  @override
  initState() {
    super.initState();
    userData();
    propertyData();
  }

  void userData() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('users/${user?.uid}').get();

    Map dataUser = snapshot.value as Map;
    print(dataUser);
    setState(() {
      username = dataUser['username'].toString();
      urlImageProfile = dataUser['urlImageProfile'];
    });
  }

  void propertyData() async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .ref('properties/-NkdBWzzNK7kmhOaRyjT')
        .get();

    Map dataUser = snapshot.value as Map;
    print(dataUser);
    setState(() {
      nameKontrakan = dataUser['namaKontrakan'].toString();
      diSewakan = dataUser['disewakan'].toString();
      alamatKontrakan = dataUser['kacamatan'] +
          dataUser['kelurahan'].toString() +
          dataUser['alamat'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthChecker(
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 138.v),
                child: Column(children: [
                  _buildMask(),
                  SizedBox(height: 26.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(nameKontrakan,
                              style: CustomTextStyles.headlineLargeGray90001))),
                  SizedBox(height: 12.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Row(children: [
                            CustomElevatedButton(
                                height: 24.v,
                                width: 72.h,
                                text: diSewakan,
                                buttonStyle: CustomButtonStyles.fillPrimaryTL6,
                                buttonTextStyle: CustomTextStyles
                                    .labelMediumPrimarySemiBold),
                            CustomImageView(
                                imagePath: ImageConstant.imgIconlyBoldStar10x10,
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(left: 10.h)),
                          ]))),
                  SizedBox(height: 16.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h, right: 64.h),
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.h, top: 12.v, bottom: 10.v),
                                child: Text(alamatKontrakan,
                                    style:
                                        CustomTextStyles.titleSmallGray90001_1))
                          ]))),
                  SizedBox(height: 24.v),
                  Divider(indent: 24.h, endIndent: 24.h),
                  SizedBox(height: 23.v),
                  _buildTypeProfileList(),
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_overview".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 13.v),
                  Container(
                      width: 372.h,
                      margin: EdgeInsets.only(left: 24.h, right: 31.h),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_lorem_ipsum_dolor2".tr,
                                style: CustomTextStyles.titleMediumGray800),
                            TextSpan(
                                text: "lbl_read_more".tr,
                                style:
                                    CustomTextStyles.titleMediumPrimaryMedium_1)
                          ]),
                          textAlign: TextAlign.left)),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_facilities".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 20.v),
                  //fasilitas
                  SizedBox(height: 24.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_location".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 19.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h, right: 99.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgIconlyBoldLocation,
                                height: 20.adaptSize,
                                width: 20.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h, top: 3.v),
                                child: Text("msg_grand_city_st_100".tr,
                                    style: CustomTextStyles.titleSmallGray700))
                          ]))),
                  SizedBox(height: 20.v),
                  _buildMask1(),
                  SizedBox(height: 24.v),
                  _buildAutoLayoutHorizontal4(),
                  SizedBox(height: 23.v),
                  _buildThemeLightCo()
                ]),
              ),
            ),
          ),
          bottomNavigationBar: _buildAutoLayoutVertical(),
        ),
      ),
    );
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
                        // onTapArrowLeft();
                      }),
                  actions: [
                    AppbarTrailingImage(
                        imagePath:
                            ImageConstant.imgIconlyLightOutlineHeartGray90001,
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
                      dotWidth: 8.h),
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }

  /// Section Widget
  Widget _buildTypeProfileList() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: urlImageProfile,
              height: 60.adaptSize,
              width: 60.adaptSize,
              radius: BorderRadius.circular(30.h)),
          Padding(
              padding: EdgeInsets.only(left: 20.h, top: 8.v, bottom: 8.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: CustomTextStyles.titleMediumGray9000118_1),
                    SizedBox(height: 4.v),
                    Text("Pemilik".tr,
                        style: CustomTextStyles.titleSmallGray700)
                  ])),
          const Spacer(),
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
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal() {
    return Padding(
        padding: EdgeInsets.only(left: 29.h, right: 32.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Column(children: [
              CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(16.h),
                  child: CustomImageView(imagePath: ImageConstant.imgFrame1)),
              SizedBox(height: 11.v),
              Text("lbl_swimming".tr,
                  style: CustomTextStyles.titleSmallGray800_1)
            ]),
          ),
          Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Column(children: [
                CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(imagePath: ImageConstant.imgFrame2)),
                SizedBox(height: 11.v),
                Text("lbl_gym_fitne".tr,
                    style: CustomTextStyles.titleSmallGray800_1)
              ])),
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: Column(children: [
                CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(imagePath: ImageConstant.imgFrame3)),
                SizedBox(height: 9.v),
                Text("lbl_restaurant".tr,
                    style: CustomTextStyles.titleSmallGray800_1)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal1() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 38.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(16.h),
                child: CustomImageView(imagePath: ImageConstant.imgFrame4)),
            SizedBox(height: 9.v),
            Text("lbl_wi_fi_ne".tr, style: CustomTextStyles.titleSmallGray800_1)
          ]),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Column(children: [
                CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(imagePath: ImageConstant.imgFrame5)),
                SizedBox(height: 9.v),
                Text("lbl_pet_center".tr,
                    style: CustomTextStyles.titleSmallGray800_1)
              ])),
          Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Column(children: [
                CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(imagePath: ImageConstant.imgFrame6)),
                SizedBox(height: 11.v),
                Text("lbl_sport_center".tr,
                    style: CustomTextStyles.titleSmallGray800_1)
              ])),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Column(children: [
                CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(16.h),
                    child: CustomImageView(imagePath: ImageConstant.imgFrame7)),
                SizedBox(height: 11.v),
                Text("lbl_laundry".tr,
                    style: CustomTextStyles.titleSmallGray800_1)
              ]))
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutHorizontal2() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_gallery".tr, style: CustomTextStyles.titleLargeGray90001),
          Padding(
              padding: EdgeInsets.only(bottom: 4.v),
              child: Text("lbl_see_all".tr,
                  style: CustomTextStyles.titleMediumPrimary))
        ]));
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]));
  }

  /// Section Widget
  Widget _buildThemeLightCo() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgProfile,
                height: 48.adaptSize,
                width: 48.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 13.v),
                child: Text("msg_charolette_hanlin".tr,
                    style: CustomTextStyles.titleMediumGray90001_1)),
            Spacer(),
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
                margin: EdgeInsets.only(left: 12.h, top: 12.v, bottom: 12.v))
          ]),
          SizedBox(height: 13.v),
          Container(
              width: 367.h,
              margin: EdgeInsets.only(right: 12.h),
              child: Text("msg_the_apartment_is".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray90001
                      .copyWith(height: 1.40))),
          SizedBox(height: 10.v),
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgIconlyLightHeart,
                height: 24.adaptSize,
                width: 24.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 4.v),
                child: Text("lbl_938".tr,
                    style: CustomTextStyles.labelLargeGray90001)),
            Padding(
                padding: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 3.v),
                child: Text("lbl_6_days_ago".tr,
                    style: CustomTextStyles.labelLargeGray700))
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAutoLayoutVertical() {
    return Container(
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 35.v),
        decoration: AppDecoration.outlineGray1001
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL36),
        child: Container(
            decoration: AppDecoration.outlineGray1001
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL36),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_price".tr,
                            style: CustomTextStyles.labelMediumGray700),
                        Container(
                            width: 104.h,
                            margin: EdgeInsets.only(top: 6.v),
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
                      ]),
                  CustomElevatedButton(
                      width: 256.h,
                      text: "lbl_booking_now".tr,
                      buttonStyle: CustomButtonStyles.outlinePrimary)
                ])));
  }
}
