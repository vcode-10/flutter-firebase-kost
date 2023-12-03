import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
import 'package:projectkost/widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyPage extends StatefulWidget {
  String property_key;
  PropertyPage({required this.property_key});

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
  var tentangKontrakan;
  var hargaPerBulan;
  var propertyID;
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
        .ref('properties/${widget.property_key}')
        .get();

    Map dataUser = snapshot.value as Map;
    print(dataUser['key']);
    setState(() {
      propertyID = dataUser['key'].toString();
      nameKontrakan = dataUser['namaKontrakan'].toString();
      diSewakan = dataUser['disewakan'].toString();
      alamatKontrakan =
          'Kabupaten/Kota: ${dataUser['kabupaten'].toString()},Kacamatan : ${dataUser['kacamatan'].toString()},\nKelurahan: ${dataUser['kelurahan'].toString()},Jalan : ${dataUser['alamat'].toString()}';

      tentangKontrakan = dataUser['tentangKontrakan'].toString();
      hargaPerBulan = dataUser['hargaPerBulan'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference refFac =
        FirebaseDatabase.instance.ref().child('facilities');
    DatabaseReference refReg =
        FirebaseDatabase.instance.ref().child('regulation');
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
                          child: Text(nameKontrakan ?? '',
                              style: CustomTextStyles.headlineLargeGray90001))),
                  SizedBox(height: 12.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Row(children: [
                            CustomElevatedButton(
                                height: 50.v,
                                width: 110.h,
                                text: 'Kos ${diSewakan ?? ''}',
                                buttonStyle: CustomButtonStyles.outlineGray,
                                buttonTextStyle:
                                    CustomTextStyles.labelLargePrimarySemiBold),
                          ]))),
                  Divider(indent: 24.h, endIndent: 24.h),
                  SizedBox(height: 23.v),
                  _buildTypeProfileList(),
                  SizedBox(height: 24.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.h),
                      child: Text("Tentang Kontrakan".tr,
                          style: CustomTextStyles.titleLargeGray90001),
                    ),
                  ),
                  SizedBox(height: 5.v),
                  Container(
                    width: 372.h,
                    margin: EdgeInsets.only(left: 24.h, right: 31.h),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: tentangKontrakan ?? '',
                              style: CustomTextStyles.titleMediumGray800),
                        ]),
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("Fasilitas Kontrakan".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 5.v),
                  FirebaseAnimatedList(
                    query: refFac.orderByKey().equalTo(widget.property_key),
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot, animation, index) {
                      Map dataArray = snapshot.value as Map;
                      return Container(
                          width: 372.h,
                          margin: EdgeInsets.only(left: 24.h, right: 31.h),
                          child: RichText(
                            text: TextSpan(children: [
                              for (var entry in dataArray.entries)
                                TextSpan(
                                    text: '- ${entry.value}\n',
                                    style: CustomTextStyles.titleMediumGray800),
                            ]),
                            textAlign: TextAlign.left,
                          ));
                    },
                  ),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("Peraturan Kontrakan".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 5.v),
                  FirebaseAnimatedList(
                    query: refReg.orderByKey().equalTo(widget.property_key),
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot, animation, index) {
                      Map dataArray = snapshot.value as Map;
                      return Container(
                          width: 372.h,
                          margin: EdgeInsets.only(left: 24.h, right: 31.h),
                          child: RichText(
                            text: TextSpan(children: [
                              for (var entry in dataArray.entries)
                                TextSpan(
                                    text: '- ${entry.value}\n',
                                    style: CustomTextStyles.titleMediumGray800),
                            ]),
                            textAlign: TextAlign.left,
                          ));
                    },
                  ),
                  SizedBox(height: 20.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("Location".tr,
                              style: CustomTextStyles.titleLargeGray90001))),
                  SizedBox(height: 19.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.h, right: 99.h),
                      child: Row(
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgIconlyBoldLocation,
                              height: 20.adaptSize,
                              width: 20.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h, top: 3.v),
                              child: Text(alamatKontrakan ?? '',
                                  style: CustomTextStyles.titleSmallGray700))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.v),
                  _buildMask1(),
                  SizedBox(height: 24.v),
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
                    Text(username ?? '',
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
  Widget _buildMask1() {
    return SizedBox(
      height: 200.v,
      width: 380.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
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
                                    style: CustomTextStyles.bodySmallGray500))
                          ])),
                  Container(
                      margin:
                          EdgeInsets.only(left: 26.h, top: 49.v, bottom: 57.v),
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.roundedBorder24,
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.imgGroup61x52),
                              fit: BoxFit.cover)),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(height: 6.v),
                        Container(
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            decoration: AppDecoration.outlineWhiteA.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder16),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgEllipse32x32,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
                Text("Harga".tr, style: CustomTextStyles.labelLargeGray700),
                Container(
                  width: 145.h,
                  margin: EdgeInsets.only(top: 6.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rp ${hargaPerBulan}",
                          style: CustomTextStyles.headlineSmallPrimary),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 1.v, top: 20.v, bottom: 10.v),
                          child: Text("/Malam".tr,
                              style: CustomTextStyles.titleSmallGray700))
                    ],
                  ),
                )
              ],
            ),
            CustomElevatedButton(
                width: 200.h,
                text: "WhatsApp".tr,
                buttonStyle: CustomButtonStyles.outlineSuccess)
          ],
        ),
      ),
    );
  }
}
