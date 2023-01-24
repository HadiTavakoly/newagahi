import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/screens/dashbord/auth_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SettingController extends GetxController {
  var isDataLoading = false.obs;
  var res;
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var newPasswordConfirmation = TextEditingController();

  Future<void> changePassword() async {
    try {
      isDataLoading(true);
      Map<String, String> queryParameters = {
        'api_token': Get.find<AuthController>().getToken().toString(),
        'old': oldPassword.text,
        'password': newPassword.text,
        'password_confirmation': newPasswordConfirmation.text,
      };
      var response = await http.post(
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/profile/changePassword',
          queryParameters,
        ),
      );

      if (response.statusCode == 200) {
        res = jsonDecode(response.body);
        if (res['code'] == 1) {
          throw 1;
        } else if (res['code'] == 0) {
          isDataLoading(false);
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
      } else {
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
    }
    finally{
      isDataLoading(false);
    }
  }
}
