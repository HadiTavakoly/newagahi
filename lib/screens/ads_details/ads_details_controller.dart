import 'package:get/get.dart';
import '../../models/ads_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dashbord/auth_controller.dart';
import 'package:flutter/material.dart';

class AdsDetailsController extends GetxController {
  var id = Get.arguments;
  Ads? adsDetailsData;
  var isDataLoading = false.obs;
  var flag = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getAdsDetails(id);
  }

  getAdsDetails(int id) async {
    try {
      isDataLoading(true);
      var respons = await http.get(
        Uri.https(
          'newagahi.ir',
          'api/v1/ads/$id',
        ),
      );

      if (respons.statusCode == 200) {
        adsDetailsData = Ads.fromJson(jsonDecode(respons.body));
      } else {
        isDataLoading(false);
        throw Exception('Fail to load ads details');
      }
    } catch (e) {
      throw Exception('Error : $e');
    } finally {
      isDataLoading(false);
    }
  }

  addToFavorite() async {
    try {
      isDataLoading(true);
      Map<String, String> queryParameters = {
        'api_token': Get.find<AuthController>().getToken().toString(),
        'ads_id': id.toString(),
      };
      var response = await http.post(
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/ads/favorite',
          queryParameters,
        ),
      );

      if (response.statusCode == 200) {
        flag(true);
        throw jsonDecode(response.body)['message'];
      } else {
        isDataLoading(false);
        throw jsonDecode(response.body)['message'];
      }
    } catch (error) {
      Get.snackbar(
        '',
        '',
        titleText: const Text(
          'توجه',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        messageText: Text(
          error.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 17,
          ),
        ),
      );
    } finally {
      isDataLoading(false);
    }
  }
}
