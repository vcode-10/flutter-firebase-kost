import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/pages/auth_checker.dart';
import 'package:projectkost/pages/home_profile.dart';
import 'package:projectkost/pages/property_page.dart';
import 'package:projectkost/widgets/app_bar/appbar_leading_image.dart';
import 'package:projectkost/widgets/app_bar/appbar_subtitle.dart';
import 'package:projectkost/widgets/app_bar/custom_app_bar.dart';

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
            query: db_Ref.orderByChild('status').equalTo(0),
            shrinkWrap: true,
            itemBuilder: (context, snapshot, animation, index) {
              Map dataArray = snapshot.value as Map;
              dataArray['key'] = snapshot.key;
              return GestureDetector(
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
    Map<String, int> property = {
      'status': 1,
    };

    FirebaseDatabase.instance
        .ref()
        .child('properties/${key}')
        .update(property)
        .whenComplete(() {
      return AppRoutes.activityPage;
    });
  }
}
