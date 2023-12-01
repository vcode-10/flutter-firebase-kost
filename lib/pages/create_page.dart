import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/utils/validation_functions.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_checkbox_button.dart';
import 'package:projectkost/widgets/custom_drop_down.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';
import 'package:projectkost/widgets/custom_icon_button.dart';
import 'package:projectkost/widgets/custom_text_form_field.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final user = FirebaseAuth.instance.currentUser;
  final TextEditingController nameKontrakan = TextEditingController();
  final TextEditingController tipeKamar = TextEditingController();
  final TextEditingController tentangKontrakan = TextEditingController();
  final TextEditingController pricePerMonth = TextEditingController();
  final TextEditingController alamatKontrakan = TextEditingController();
  final TextEditingController kabupatenKontrakan = TextEditingController();
  final TextEditingController kacamatanKontrakan = TextEditingController();
  final TextEditingController kelurahanKontrakan = TextEditingController();
  var disewakan;
  bool status = false;
  bool isCheckedAC = false;
  bool isCheckedCCTV = false;
  bool isCheckedDispenser = false;
  bool isCheckedKamarMandiDalam = false;
  bool isCheckedKamarMandiLuar = false;
  bool isCheckedKasur = false;
  bool isCheckedLemari = false;
  bool isCheckedParkir = false;
  bool isChecked24Jam = false;
  bool isCheckedPasutri = false;
  bool isCheckedHewan = false;
  bool isCheckedRokok = false;
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
                      Text('Data Kontrakan',
                          style: CustomTextStyles.titleMediumGray800SemiBold
                              .copyWith(color: appTheme.gray800)),
                      const Divider(),
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
                      CustomDropDown(
                          hintText: 'Disewakan',
                          hintStyle: theme.textTheme.bodyMedium,
                          prefix: const Icon(Icons.arrow_drop_down),
                          items: [
                            SelectionPopupModel(title: 'Laki - Laki'),
                            SelectionPopupModel(title: 'Perempuan'),
                            SelectionPopupModel(title: 'Campur'),
                          ],
                          onChanged: (val) => disewakan = val),
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
                      Text('Alamat Kontrakan',
                          style: CustomTextStyles.titleMediumGray800SemiBold
                              .copyWith(color: appTheme.gray800)),
                      const Divider(),
                      CustomTextFormField(
                          controller: kabupatenKontrakan,
                          hintText: "Kabupaten".tr,
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
                          controller: kacamatanKontrakan,
                          hintText: "Kacamatan".tr,
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
                          controller: kelurahanKontrakan,
                          hintText: "Kelurahan".tr,
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
                          controller: alamatKontrakan,
                          hintText: "Jalan/No Rumah".tr,
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
                      Text('Fasilitas Kontrakan',
                          style: CustomTextStyles.titleMediumGray800SemiBold
                              .copyWith(color: appTheme.gray800)),
                      const Divider(),
                      CustomCheckboxButton(
                        value: isCheckedAC,
                        onChange: (value) {
                          setState(() {
                            isCheckedAC = value;
                          });
                        },
                        text: 'AC',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedCCTV,
                        onChange: (value) {
                          setState(() {
                            isCheckedCCTV = value;
                          });
                        },
                        text: 'CCTV',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedDispenser,
                        onChange: (value) {
                          setState(() {
                            isCheckedDispenser = value;
                          });
                        },
                        text: 'Dispenser',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedKamarMandiDalam,
                        onChange: (value) {
                          setState(() {
                            isCheckedKamarMandiDalam = value;
                          });
                        },
                        text: 'Kamar Mandi (Didalam)',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedKamarMandiLuar,
                        onChange: (value) {
                          setState(() {
                            isCheckedKamarMandiLuar = value;
                          });
                        },
                        text: 'Kamar Mandi (Diluar)',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedKasur,
                        onChange: (value) {
                          setState(() {
                            isCheckedKasur = value;
                          });
                        },
                        text: 'Kasur',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedLemari,
                        onChange: (value) {
                          setState(() {
                            isCheckedLemari = value;
                          });
                        },
                        text: 'Lemari',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedParkir,
                        onChange: (value) {
                          setState(() {
                            isCheckedParkir = value;
                          });
                        },
                        text: 'Parkir',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 24.v),
                      Text('Peraturan Kontrakan',
                          style: CustomTextStyles.titleMediumGray800SemiBold
                              .copyWith(color: appTheme.gray800)),
                      const Divider(),
                      CustomCheckboxButton(
                        value: isChecked24Jam,
                        onChange: (value) {
                          setState(() {
                            isChecked24Jam = value;
                          });
                        },
                        text: 'Akses 24 Jam',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedPasutri,
                        onChange: (value) {
                          setState(() {
                            isCheckedPasutri = value;
                          });
                        },
                        text: 'Boleh pasutri',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedHewan,
                        onChange: (value) {
                          setState(() {
                            isCheckedHewan = value;
                          });
                        },
                        text: 'Boleh bawa hewan',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      CustomCheckboxButton(
                        value: isCheckedRokok,
                        onChange: (value) {
                          setState(() {
                            isCheckedRokok = value;
                          });
                        },
                        text: 'Dilarang Merokok dikamar',
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                      SizedBox(height: 24.v),
                      Text('Gambar Kontrakan',
                          style: CustomTextStyles.titleMediumGray800SemiBold
                              .copyWith(color: appTheme.gray800)),
                      const Divider(),
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
                      SizedBox(height: 24.v),
                      _buildContinue(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        text: "Buat".tr,
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 48.v),
        onPressed: () {
          // uploadData();
        },
        buttonStyle: CustomButtonStyles.fillBlue);
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

  uploadData() async {
    try {
      // Upload property data
      Map<String, String> dataKontrakan = {
        'userId': '${user?.uid}',
        'namaKontrakan': nameKontrakan.text,
        'tipeKontrakan': tipeKamar.text,
        'disewakan': disewakan.toString(),
        'tentangKontrakan': tentangKontrakan.text,
        'hargaPerBulan': pricePerMonth.text,
        'kabupaten': kabupatenKontrakan.text,
        'kacamatan': kacamatanKontrakan.text,
        'kelurahan': kelurahanKontrakan.text,
        'alamat': alamatKontrakan.text,
        'status': status.toString(),
      };

      DatabaseReference propertyRef =
          FirebaseDatabase.instance.ref().child('property');
      DatabaseReference propertyKey = propertyRef.push();
      propertyKey.set(dataKontrakan);

      // Get the generated property ID
      String propertyID = propertyKey.key ?? '';

      // Upload facility data
      Map<String, String> fasilitasKontrakan = {
        'propertyID': propertyID,
        'AC': isCheckedAC ? 'AC' : '',
        'CCTV': isCheckedCCTV ? 'CCTV' : '',
        'Dispenser': isCheckedDispenser ? 'Dispenser' : '',
        'KamarMandiDalam':
            isCheckedKamarMandiDalam ? 'Kamar Mandi (Didalam)' : '',
        'KamarMandiLuar': isCheckedKamarMandiLuar ? 'Kamar Mandi (Diluar)' : '',
        'Kasur': isCheckedKasur ? 'Kasur' : '',
        'Lemari': isCheckedLemari ? 'Lemari' : '',
        'Parkir': isCheckedParkir ? 'Parkir' : '',
      };

      DatabaseReference facilityRef =
          FirebaseDatabase.instance.ref().child('facility');
      facilityRef.push().set(fasilitasKontrakan);

      // Upload regulation data
      Map<String, String> regulasiKontrakan = {
        'propertyID': propertyID,
        'akses24': isChecked24Jam ? 'Akses 24 Jam' : '',
        'pasutri': isCheckedPasutri ? 'Boleh Pasutri' : '',
        'hewan': isCheckedHewan ? 'Boleh bawa hewan' : '',
        'rokok': isCheckedRokok ? 'Dilarang Merokok di kamar' : '',
      };

      DatabaseReference regulationRef =
          FirebaseDatabase.instance.ref().child('regulation');
      regulationRef.push().set(regulasiKontrakan);
    } catch (e) {
      print(e);
    }
  }
}
