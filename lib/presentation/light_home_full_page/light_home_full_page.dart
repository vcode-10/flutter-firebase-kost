import '../light_home_full_page/widgets/realestatecard_item_widget.dart';
import 'controller/light_home_full_controller.dart';
import 'models/light_home_full_model.dart';
import 'models/realestatecard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:projectkost/core/app_export.dart';

class LightHomeFullPage extends StatelessWidget {
  LightHomeFullPage({Key? key})
      : super(
          key: key,
        );

  LightHomeFullController controller =
      Get.put(LightHomeFullController(LightHomeFullModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 24.v),
              _buildRealEstateCard(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRealEstateCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 275.v,
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller
              .lightHomeFullModelObj.value.realestatecardItemList.value.length,
          itemBuilder: (context, index) {
            RealestatecardItemModel model = controller.lightHomeFullModelObj
                .value.realestatecardItemList.value[index];
            return RealestatecardItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
