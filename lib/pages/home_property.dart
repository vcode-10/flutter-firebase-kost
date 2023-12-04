import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/pages/property_page.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

class HomeProperty extends StatefulWidget {
  const HomeProperty({super.key});

  @override
  State<HomeProperty> createState() => _HomePropertyState();
}

class _HomePropertyState extends State<HomeProperty> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref =
        FirebaseDatabase.instance.ref().child('properties');
    return AuthChecker(
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: FirebaseAnimatedList(
            query: db_Ref,
            shrinkWrap: true,
            itemBuilder: (context, snapshot, animation, index) {
              Map dataArray = snapshot.value as Map;
              dataArray['key'] = snapshot.key;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PropertyPage(
                          property_key: dataArray['key'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(14.h),
                    decoration: AppDecoration.outlineOnErrorContainer.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder28,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120.adaptSize,
                          width: 120.adaptSize,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                imagePath: dataArray['urlThumbnail'],
                                height: 120.adaptSize,
                                width: 120.adaptSize,
                                radius: BorderRadius.circular(
                                  20.h,
                                ),
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.h,
                            top: 19.v,
                            bottom: 19.v,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 110.h,
                                child: Text(
                                  dataArray['namaKontrakan']
                                      .split(' ')
                                      .map((word) => word.isNotEmpty
                                          ? '${word[0].toUpperCase()}${word.substring(1)}'
                                          : '')
                                      .join(' '),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleLargeGray90001
                                      .copyWith(
                                    height: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Text(
                                dataArray['kabupaten']
                                    .toString()
                                    .replaceFirstMapped(
                                      RegExp(r'\b\w'),
                                      (match) =>
                                          match.group(0)?.toUpperCase() ?? '',
                                    ),
                                style: CustomTextStyles.bodyMediumGray700,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 14.v,
                            right: 4.h,
                            bottom: 14.v,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomElevatedButton(
                                height: 25.v,
                                width: 120.h,
                                text: dataArray['disewakan']
                                    .toString()
                                    .split(' ')
                                    .map((word) => word.isNotEmpty
                                        ? '${word[0].toUpperCase()}${word.substring(1)}'
                                        : '')
                                    .join(' '),
                                margin: EdgeInsets.only(
                                  top: 12.v,
                                  right: 12.h,
                                ),
                              ),
                              SizedBox(height: 24.v),
                              Text(
                                NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'Rp',
                                  decimalDigits: 0,
                                ).format(dataArray['hargaPerBulan'] ?? 0),
                                style: CustomTextStyles.headlineSmallPrimary,
                              ),
                              SizedBox(height: 5.v),
                              IconButton(
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.blue[900],
                                ),
                                onPressed: () {
                                  db_Ref.child(dataArray['key']).remove();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
            text: "Kontrakan Saya".tr, margin: EdgeInsets.only(left: 16.h)));
  }
}
