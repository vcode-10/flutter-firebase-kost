import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/core/utils/image_constant.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/home_page.dart';
import 'package:projectkost/theme/custom_button_style.dart';
import 'package:projectkost/theme/custom_text_style.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_trailing_image.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class PropertyPage extends StatefulWidget {
  String property_key;
  PropertyPage({required this.property_key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  var username;
  var urlImageProfile;
  var nameKontrakan;
  var alamatKontrakan;
  var diSewakan;
  var tentangKontrakan;
  var hargaPerBulan;
  var propertyID;
  var userID;
  var phoneNumber;
  var urlDapur;
  var urlFotoDepan;
  var urlKamar;
  var urlKamarMandi;
  var urlRuangTengah;
  DatabaseReference refUser = FirebaseDatabase.instance.ref().child('users');
  @override
  initState() {
    super.initState();
    propertyData();
  }

  void propertyData() async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .ref('properties/${widget.property_key}')
        .get();

    Map dataUser = snapshot.value as Map;
    setState(() {
      userID = dataUser['userId'].toString();
      propertyID = dataUser['key'].toString();
      nameKontrakan = dataUser['namaKontrakan'].toString();
      diSewakan = dataUser['disewakan'].toString();
      alamatKontrakan =
          'Kabupaten/Kota: ${dataUser['kabupaten'].toString()},Kacamatan : ${dataUser['kacamatan'].toString()},\nKelurahan: ${dataUser['kelurahan'].toString()},Jalan : ${dataUser['alamat'].toString()}';

      tentangKontrakan = dataUser['tentangKontrakan'].toString();
      hargaPerBulan = dataUser['hargaPerBulan'].toString();
      urlDapur = dataUser['urlDapur'];
      urlFotoDepan = dataUser['urlFotoDepan'];
      urlKamar = dataUser['urlKamar'];
      urlKamarMandi = dataUser['urlKamarMandi'];
      urlRuangTengah = dataUser['urlRuangTengah'];
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
          appBar: _buildAppBar(),
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
                          child: Text(
                              nameKontrakan
                                  .split(' ')
                                  .map((word) => word.isNotEmpty
                                      ? '${word[0].toUpperCase()}${word.substring(1)}'
                                      : '')
                                  .join(' '),
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
                                text:
                                    'Kos ${diSewakan.split(' ').map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : '').join(' ')}',
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
                      padding: EdgeInsets.only(left: 24.h, right: 10.h),
                      child: Row(
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgIconlyBoldLocation,
                              height: 20.adaptSize,
                              width: 20.adaptSize),
                          Padding(
                              padding: EdgeInsets.only(left: 8.h, top: 3.v),
                              child: Text(
                                  alamatKontrakan
                                      .split(' ')
                                      .map((word) => word.isNotEmpty
                                          ? '${word[0].toUpperCase()}${word.substring(1)}'
                                          : '')
                                      .join(' '),
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
      child: ImageSlideshow(
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          CustomImageView(
              imagePath: urlFotoDepan ?? ImageConstant.imageNotFound,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: urlRuangTengah ?? ImageConstant.imageNotFound,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: urlKamar ?? ImageConstant.imageNotFound,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: urlKamarMandi ?? ImageConstant.imageNotFound,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: urlDapur ?? ImageConstant.imageNotFound,
              height: 416.v,
              width: 428.h,
              alignment: Alignment.center),
        ],
      ),
    );
  }

  void launchWhatsApp(String phoneNumber) async {
    String url = "https://wa.me/+62$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
            Navigator.of(context).pop();
          }),
      // actions: [
      //   AppbarTrailingImage(
      //       imagePath: ImageConstant.imgIconlyLightOutlineHeartGray90001,
      //       margin: EdgeInsets.only(left: 24.h)),
      //   AppbarTrailingImage(
      //       imagePath: ImageConstant.imgSend,
      //       margin: EdgeInsets.only(left: 20.h, right: 24.h))
      // ],
    );
  }

  /// Section Widget
  Widget _buildTypeProfileList() {
    return FirebaseAnimatedList(
      query: refUser.orderByKey().equalTo(userID),
      shrinkWrap: true,
      itemBuilder: (context, snapshot, animation, index) {
        Map dataArray = snapshot.value as Map;
        phoneNumber = dataArray['phoneNumber'];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                  imagePath: dataArray['urlImageProfile'] ?? urlImageProfile,
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  radius: BorderRadius.circular(30.h)),
              Padding(
                  padding: EdgeInsets.only(left: 20.h, top: 8.v, bottom: 8.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataArray['username'] ?? '',
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
                margin: EdgeInsets.symmetric(vertical: 16.v),
                onTap: () {
                  launchWhatsApp(dataArray['phoneNumber']);
                },
              ),
            ],
          ),
        );
      },
    );
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
                  Container(
                    margin:
                        EdgeInsets.only(left: 26.h, top: 49.v, bottom: 57.v),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgGroup61x52),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                                alignment: Alignment.center)),
                      ],
                    ),
                  ),
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
                  width: 160.h,
                  margin: EdgeInsets.only(top: 6.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp',
                            decimalDigits: 0,
                          ).format(int.parse(hargaPerBulan ?? '0')),
                          style: CustomTextStyles.headlineSmallPrimary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.v, bottom: 10.v),
                        child: Flexible(
                          child: Text("/Bulan".tr,
                              style: CustomTextStyles.titleSmallGray700),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            CustomElevatedButton(
              width: 190.h,
              text: "WhatsApp".tr,
              buttonStyle: CustomButtonStyles.outlineSuccess,
              onPressed: () {
                launchWhatsApp(phoneNumber);
              },
            ),
          ],
        ),
      ),
    );
  }
}
