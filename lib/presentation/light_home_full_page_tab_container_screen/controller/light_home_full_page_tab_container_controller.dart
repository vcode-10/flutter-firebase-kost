import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_home_full_page_tab_container_screen/models/light_home_full_page_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LightHomeFullPageTabContainerScreen.
///
/// This class manages the state of the LightHomeFullPageTabContainerScreen, including the
/// current lightHomeFullPageTabContainerModelObj
class LightHomeFullPageTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<LightHomeFullPageTabContainerModel> lightHomeFullPageTabContainerModelObj =
      LightHomeFullPageTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 5));

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
