import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newagahi/screens/subcategory/subcategory_page.dart';
import '../../models/ads_model.dart';

class SearchController extends GetxController {
  Ads? searchData;
  var isDataLoading = false.obs;
  var page = 1;
  var subCategoryName = Get.arguments?[1] ?? '';
  var stateName = Get.arguments?[3]??'';
  var cityName = Get.arguments?[5]??'';
  RxMap query = {
    'search': '',
    'subCategoryId': Get.arguments?[0] ?? '',
    'stateId': Get.arguments?[2]??0,
    'cityId': Get.arguments?[4] ?? 0,
  }.obs;

  @override
  void onInit() {
    getFiltredAds(query);
    debounce(
      query,
      getFiltredAds,
      time: const Duration(
        seconds: 1,
        // milliseconds: 500,
      ),
    );
    super.onInit();
  }

  Future getFiltredAds(Map q) async {
    Map<String, String> queryParameters = {
      'page': '$page',
      'search': q['search'],
      'category_id': q['subCategoryId'],
      'state_id': q['stateId'].toString(),
      'city_id': q['cityId'].toString(),
    };
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https('newagahi.ir', 'api/v1/ads', queryParameters),
      );

      if (respons.statusCode == 200) {
        searchData = Ads.fromJson(
          jsonDecode(respons.body),
        );
      } else {
        isDataLoading(false);
        throw Exception('Fail to load filtred ads');
      }
    } catch (e) {
      throw Exception('$e');
    } finally {
      isDataLoading(false);
      // update();
    }
  }
}
