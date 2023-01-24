import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newagahi/screens/subcategory/subcategory_page.dart';
import '../../models/ads_model.dart';

class SearchController extends GetxController {
  Ads? searchData;
  // var categoryId = 0.obs;
  // var categoryName = ''.obs;
  var subCategoryName = ''.obs;
  var isDataLoading = false.obs;
  // RxList<Datum> list = <Datum>[].obs;
  // ScrollController controller = ScrollController();
  // var search = ''.obs;

  RxMap query = {
    'search': '',
    'subCategoryId':'',
    'stateId': '',
    'cityId': '',
  }.obs;
  var page = 1;

  @override
  void onInit() {
    getFiltredAds(query);
    debounce(
      query,
      getFiltredAds,
      time: const Duration(
        seconds: 2,
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
      // 'state_id': q['stateId'],
      // 'city_id': q['cityId'],
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
