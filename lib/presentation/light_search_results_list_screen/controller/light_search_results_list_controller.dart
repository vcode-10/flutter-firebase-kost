import 'package:projectkost/core/app_export.dart';
import 'package:projectkost/presentation/light_search_results_list_screen/models/light_search_results_list_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LightSearchResultsListScreen.
///
/// This class manages the state of the LightSearchResultsListScreen, including the
/// current lightSearchResultsListModelObj
class LightSearchResultsListController extends GetxController {
  TextEditingController stateFilledSearchController = TextEditingController();

  Rx<LightSearchResultsListModel> lightSearchResultsListModelObj =
      LightSearchResultsListModel().obs;

  @override
  void onClose() {
    super.onClose();
    stateFilledSearchController.dispose();
  }
}
