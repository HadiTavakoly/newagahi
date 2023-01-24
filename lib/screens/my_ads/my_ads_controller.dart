import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:newagahi/screens/dashbord/auth_controller.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyAdsController extends GetxController {
  Ads? myAdsData;
  var isDataLoading = false.obs;
  var res;
  Map<String, String> queryParameters = {
    'api_token': Get.find<AuthController>().getToken().toString(),
  };

  @override
  Future<void> onInit() async {
    super.onInit();
    getMyAds();
  }

  getMyAds() async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/my-ads',
          queryParameters,
        ),
      );
      if (response.statusCode == 200) {
        myAdsData = Ads.fromJson(jsonDecode(response.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load my ads');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }

  refreshMyAdsById(int? id) async {
    try {
      isDataLoading(true);
      var response = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/ads/refresh/$id',
          queryParameters,
        ),
      );
      if (response.statusCode == 200) {
        res = jsonDecode(response.body);
        if (res['code'] == 1) {
          throw 1;
        } else if (res['code'] == 0) {
          throw res['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      if (error.toString() == '1') {
        Get.back();
        Get.snackbar(
          '',
          '',
          titleText: const Text(
            'پیام',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          messageText: Text(
            res['message'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green.shade400,
              fontSize: 17,
            ),
          ),
        );
      }
      else {
        Get.snackbar(
          '',
          '',
          titleText: const Text(
            'خطا',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          messageText: Text(
            error.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffC42127),
              fontSize: 17,
            ),
          ),
        );
      }
    } finally {
      isDataLoading(false);
    }
  }
}
