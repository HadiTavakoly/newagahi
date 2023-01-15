import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/ads_model.dart';

class HomeController extends GetxController {
  Ads? adsData;
  var tabIndex = 0.obs;
  var cityName = ''.obs;
  var isDataLoading = false.obs;
  RxList<Datum> list = <Datum>[].obs;
  ScrollController controller = ScrollController();
  var page = 1;

  @override
  void onInit() {
    generateList();
    addItems();
    super.onInit();
  }

  addItems() async {
    controller.addListener(
      () {
        if (controller.position.maxScrollExtent == controller.position.pixels) {
          getAds();
        }
      },
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  generateList() {
    getAds();
  }

  Future getAds() async {
    Map<String, String> queryParameters = {'page': '$page'};
    try {
      isDataLoading(true);
      update();

      var respons = await http.get(
        Uri.https('newagahi.ir', 'api/v1/ads', queryParameters),
      );

      if (respons.statusCode == 200) {
        adsData = Ads.fromJson(
          jsonDecode(respons.body),
        );
        list.addAll(
          adsData!.data!.toList(),
        );
        page++;
      } else {
        throw Exception('Fail to load last ads');
      }
    } catch (e) {
      throw Exception('Fail to load last ads');
    } finally {
      isDataLoading(false);
      update();
    }
  }
}
