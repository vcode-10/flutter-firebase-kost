import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  DatabaseReference? _databaseReference;

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref().child("properties");
  }

  final TextEditingController nameKontrakan = TextEditingController();
  final TextEditingController tipeKamar = TextEditingController();
  final TextEditingController tentangKontrakan = TextEditingController();
  final TextEditingController pricePerMonth = TextEditingController();
  final TextEditingController alamatKontrakan = TextEditingController();
  final TextEditingController kabupatenKontrakan = TextEditingController();
  final TextEditingController kacamatanKontrakan = TextEditingController();
  final TextEditingController kelurahanKontrakan = TextEditingController();
  var urlRuangTengah;
  var urlKamarMandi;
  var urlFotoDepan;
  var urlThumbnail;
  var disewakan;
  var urlKamar;
  var urlDapur;
  File? imageRuangTengah;
  File? imageKamarMandi;
  File? imageThumbnail;
  File? imageDepan;
  File? imageDapur;
  File? imageKamar;
  ImagePicker image1 = ImagePicker();
  ImagePicker image2 = ImagePicker();
  ImagePicker image3 = ImagePicker();
  ImagePicker image4 = ImagePicker();
  ImagePicker image5 = ImagePicker();
  ImagePicker image6 = ImagePicker();
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
                        onChanged: (val) {
                          // Access the title property of SelectionPopupModel
                          disewakan = val?.title ??
                              ''; // Jika val null, berikan nilai default (misal: '')
                        },
                      ),
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
                                    gallery: "Thumbnail".tr,
                                    onTap: getThumbnail),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Depan".tr, onTap: getDepan),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Ruang Tengah".tr,
                                    onTap: getRuangTengah),
                              ])),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Kamar".tr, onTap: getKamar),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Dapur".tr, onTap: getDapur),
                                _buildAutoLayoutVertical(
                                    gallery: "Foto Kamar Mandi".tr,
                                    onTap: getKamarMandi),
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
          uploadData();
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

  Widget _buildAutoLayoutVertical(
      {required String gallery, required VoidCallback? onTap}) {
    return Column(children: [
      CustomIconButton(
          height: 72.adaptSize,
          width: 72.adaptSize,
          padding: EdgeInsets.all(20.h),
          decoration: IconButtonStyleHelper.outlineGray,
          onTap: onTap != null ? () => onTap() : null,
          child: _buildImageWidget()),
      SizedBox(height: 11.v),
      Text(gallery,
          style: CustomTextStyles.titleMediumGray800SemiBold
              .copyWith(color: appTheme.gray800))
    ]);
  }

  Widget _buildImageWidget() {
    if (imageThumbnail != null) {
      return Image.file(
        imageThumbnail!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else if (imageDapur != null) {
      return Image.file(
        imageDapur!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else if (imageDepan != null) {
      return Image.file(
        imageDepan!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else if (imageKamarMandi != null) {
      return Image.file(
        imageKamarMandi!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else if (imageKamar != null) {
      return Image.file(
        imageKamar!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else if (imageRuangTengah != null) {
      return Image.file(
        imageRuangTengah!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      );
    } else {
      return CustomImageView(
        imagePath: ImageConstant.imgAutoLayoutHorizontal56x56,
      );
    }
  }

  getThumbnail() async {
    var img1 = await image1.pickImage(source: ImageSource.gallery);
    if (img1 != null) {
      setState(() {
        imageThumbnail = File(img1.path);
      });
    }
  }

  getDapur() async {
    var img2 = await image2.pickImage(source: ImageSource.gallery);
    if (img2 != null) {
      setState(() {
        imageDapur = File(img2.path);
      });
    }
  }

  getDepan() async {
    var img3 = await image3.pickImage(source: ImageSource.gallery);
    if (img3 != null) {
      setState(() {
        imageDepan = File(img3.path);
      });
    }
  }

  getKamarMandi() async {
    var img4 = await image4.pickImage(source: ImageSource.gallery);
    if (img4 != null) {
      setState(() {
        imageKamarMandi = File(img4.path);
      });
    }
  }

  getRuangTengah() async {
    var img5 = await image5.pickImage(source: ImageSource.gallery);
    if (img5 != null) {
      setState(() {
        imageRuangTengah = File(img5.path);
      });
    }
  }

  getKamar() async {
    var img6 = await image6.pickImage(source: ImageSource.gallery);
    if (img6 != null) {
      setState(() {
        imageKamar = File(img6.path);
      });
    }
  }

  String generateRandomFileName() {
    final random = Random();
    final randomNumber = random.nextInt(1000000); // Ubah sesuai kebutuhan
    return 'random_$randomNumber.jpg';
  }

  Future<String> uploadImage(File? imageFile) async {
    final randomFileName = generateRandomFileName();
    var imageStorageRef =
        FirebaseStorage.instance.ref().child("property").child(randomFileName);
    UploadTask uploadTask = imageStorageRef.putFile(imageFile!);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  uploadData() async {
    int status = 0;
    int hargaPerBulanNew = int.parse(pricePerMonth.text);
    try {
      urlThumbnail = await uploadImage(imageThumbnail);
      urlFotoDepan = await uploadImage(
        imageDepan,
      );

      urlDapur = await uploadImage(imageDapur);
      urlKamarMandi = await uploadImage(imageKamarMandi);
      urlRuangTengah = await uploadImage(imageRuangTengah);
      urlKamar = await uploadImage(imageKamar);

      setState(() {
        urlRuangTengah = urlRuangTengah;
        urlKamarMandi = urlKamarMandi;
        urlThumbnail = urlThumbnail;
        urlFotoDepan = urlFotoDepan;
        urlDapur = urlDapur;
        urlKamar = urlKamar;
      });

      if (urlThumbnail != null) {
        Map<dynamic, dynamic> dataKontrakan = {
          'userId': '${user?.uid}',
          'namaKontrakan': nameKontrakan.text.toLowerCase(),
          'tipeKontrakan': tipeKamar.text.toLowerCase(),
          'disewakan': disewakan.toString(),
          'tentangKontrakan': tentangKontrakan.text.toLowerCase(),
          'hargaPerBulan': hargaPerBulanNew,
          'kabupaten': kabupatenKontrakan.text.toLowerCase(),
          'kacamatan': kacamatanKontrakan.text.toLowerCase(),
          'kelurahan': kelurahanKontrakan.text.toLowerCase(),
          'alamat': alamatKontrakan.text.toLowerCase(),
          'status': status,
          'urlRuangTengah': urlRuangTengah,
          'urlKamarMandi': urlKamarMandi,
          'urlThumbnail': urlThumbnail,
          'urlFotoDepan': urlFotoDepan,
          'urlDapur': urlDapur,
          'urlKamar': urlKamar,
          'role': 'user',
          'searchField':
              '${nameKontrakan.text.toLowerCase()}_${kabupatenKontrakan.text.toLowerCase()}_${kacamatanKontrakan.text.toLowerCase()}_${kelurahanKontrakan.text.toLowerCase()}_${alamatKontrakan.text.toLowerCase()}',
        };

        DatabaseReference newPropertyRef = _databaseReference!.push();

        newPropertyRef.set(dataKontrakan);

        String propertyID = newPropertyRef.key ?? '';

        Map<String, String> fasilitasKontrakan = {
          if (isCheckedAC) 'AC': 'AC',
          if (isCheckedCCTV) 'CCTV': 'CCTV',
          if (isCheckedDispenser) 'Dispenser': 'Dispenser',
          if (isCheckedKamarMandiDalam)
            'KamarMandiDalam': 'Kamar Mandi (Didalam)',
          if (isCheckedKamarMandiLuar) 'KamarMandiLuar': 'Kamar Mandi (Diluar)',
          if (isCheckedKasur) 'Kasur': 'Kasur',
          if (isCheckedLemari) 'Lemari': 'Lemari',
          if (isCheckedParkir) 'Parkir': 'Parkir',
        };

        DatabaseReference facilityRef =
            FirebaseDatabase.instance.ref().child('facilities');

        facilityRef.child(propertyID).set(fasilitasKontrakan);

        Map<String, String> regulasiKontrakan = {
          if (isChecked24Jam) 'Akses24Jam': 'Akses 24 Jam',
          if (isCheckedPasutri) 'Pasutri': 'Boleh Pasutri',
          if (isCheckedHewan) 'Hewan': 'Boleh bawa hewan',
          if (isCheckedRokok) 'Rokok': 'Dilarang Merokok di kamar',
        };

        DatabaseReference regulationRef =
            FirebaseDatabase.instance.ref().child('regulation');

        regulationRef.child(propertyID).set(regulasiKontrakan).whenComplete(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomeProfile(),
            ),
          );
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
