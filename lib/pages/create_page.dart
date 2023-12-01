import 'package:flutter/material.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_drop_down.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController nameKontrakan = TextEditingController();
  final TextEditingController tipeKamar = TextEditingController();
  final TextEditingController tentangKontrakan = TextEditingController();
  final TextEditingController pricePerMonth = TextEditingController();
  final TextEditingController alamatKontrakan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthChecker(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 9.v),
              child: Padding(
                padding: EdgeInsets.only(left: 22.h, right: 6.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          controller: nameKontrakan,
                          hintText: "Nama Kontrakan".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                          controller: tipeKamar,
                          hintText: "Tipe Kamar".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 24.v),
                      //Disewa untuk Wanita,Pria, dan Campur
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                          controller: tentangKontrakan,
                          hintText: "Tentang Kontrakan".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                          controller: pricePerMonth,
                          hintText: "Harga per bulan".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 24.v),
                      CustomDropDown(
                          hintText: 'Kabupaten',
                          hintStyle: theme.textTheme.bodyMedium,
                          prefix: const Icon(Icons.arrow_drop_down),
                          items: [
                            SelectionPopupModel(title: 'Option 1'),
                            SelectionPopupModel(title: 'Option 2'),
                            SelectionPopupModel(title: 'Option 3'),
                          ],
                          onChanged: (val) => val),
                      //Kabupaten
                      SizedBox(height: 24.v),
                      CustomDropDown(
                          hintText: 'Kacamatan',
                          hintStyle: theme.textTheme.bodyMedium,
                          prefix: const Icon(Icons.arrow_drop_down),
                          items: [
                            SelectionPopupModel(title: 'Option 1'),
                            SelectionPopupModel(title: 'Option 2'),
                            SelectionPopupModel(title: 'Option 3'),
                          ],
                          onChanged: (val) => val),
                      //Kacamatan
                      SizedBox(height: 24.v),
                      CustomDropDown(
                          hintText: 'Kelurahan',
                          hintStyle: theme.textTheme.bodyMedium,
                          prefix: const Icon(Icons.arrow_drop_down),
                          items: [
                            SelectionPopupModel(title: 'Option 1'),
                            SelectionPopupModel(title: 'Option 2'),
                            SelectionPopupModel(title: 'Option 3'),
                          ],
                          onChanged: (val) => val),
                      //Kelurahan
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                          controller: alamatKontrakan,
                          hintText: "Alamat Kontrakan, Jln".tr,
                          hintStyle: theme.textTheme.bodyMedium!,
                          validator: (value) {
                            if (!isText(value)) {
                              return "err_msg_please_enter_valid_text".tr;
                            }
                            return null;
                          },
                          borderDecoration: TextFormFieldStyleHelper.fillGray,
                          fillColor: appTheme.gray50),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildAutoLayoutVertical(
                                    gallery: "Thumbnail".tr),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Depan".tr),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Ruang Tengah".tr),
                              ])),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Kamar".tr),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Dapur".tr),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Kamar Mandi".tr),
                              ])),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 52.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 13.v),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeProfile(),
                ),
              );
            }),
        title: AppbarSubtitle(
            text: "Buat Kontrakan".tr, margin: EdgeInsets.only(left: 16.h)));
  }

  Widget _buildAutoLayoutVertical({required String gallery}) {
    return Column(children: [
      CustomIconButton(
          height: 72.adaptSize,
          width: 72.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.outlineGray,
          child: CustomImageView(
              imagePath: ImageConstant.imgAutoLayoutHorizontal56x56)),
      SizedBox(height: 11.v),
      Text(gallery,
          style: CustomTextStyles.titleMediumGray800SemiBold
              .copyWith(color: appTheme.gray800))
    ]);
  }
}
