import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';
import 'package:projectkost/widgets/custom_elevated_button.dart';

class ActiveProperty extends StatefulWidget {
  const ActiveProperty({super.key});

  @override
  State<ActiveProperty> createState() => _ActivePropertyState();
}

class _ActivePropertyState extends State<ActiveProperty> {
  @override
  Widget build(BuildContext context) {
    DatabaseReference db_Ref =
        FirebaseDatabase.instance.ref().child('properties');
    return AuthChecker(
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(),
          body: FirebaseAnimatedList(
            query: db_Ref.orderByChild('status').equalTo('false'),
            shrinkWrap: true,
            itemBuilder: (context, snapshot, animation, index) {
              Map dataArray = snapshot.value as Map;
              dataArray['key'] = snapshot.key;
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => UpdateRecord(
                  //       dataArray_Key: dataArray['key'],
                  //     ),
                  //   ),
                  // );
                  // print(dataArray['urlThumbnail']);
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
                                dataArray['namaKontrakan'],
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
                              dataArray['namaKontrakan'],
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
                            IconButton(
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.blue[900],
                              ),
                              onPressed: () {
                                directupdate(dataArray['key']);
                              },
                            ),
                            SizedBox(height: 24.v),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red[900],
                              ),
                              onPressed: () {
                                db_Ref.child(dataArray['key']).remove();
                              },
                            ),

                            SizedBox(height: 5.v),
                            // Obx(
                            //   () => Text(
                            //     currentItem.night!.value,
                            //     style: theme.textTheme.bodySmall,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
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
            text: "Aktivasi Kontrakan ".tr,
            margin: EdgeInsets.only(left: 16.h)));
  }

  directupdate(String key) {
    Map<String, String> property = {
      'status': 'true',
    };

    FirebaseDatabase.instance
        .ref()
        .child('properties/${key}')
        .update(property)
        .whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ActiveProperty(),
        ),
      );
    });
  }
}
