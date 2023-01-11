import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newagahi/models/auth_model.dart';
import 'package:newagahi/screens/splash/auth_controller.dart';

class LoginController extends GetxController with CacheManager {
  Auth? stateData;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscure = true.obs;
  var message = ''.obs;
  var visible = false.obs;

  Future<void> loginWithEmail() async {
    // var headers = {'Content-Type': 'application/json'};
    try {
      var response = await http.post(
        Uri.https(
          'newagahi.ir',
          'api/v1/auth/login',
        ),
        body: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        stateData = Auth.fromJson(jsonDecode(response.body));

        if (stateData!.code == 1) {
          var token = stateData!.data![0].apiToken;
          var tel = stateData!.data![0].tel;
          await saveToken(token);
          await saveTel(tel);

          usernameController.clear();
          passwordController.clear();
          Get.find<AuthController>().login(
            token,
          );
          Get.back();
        } else if (stateData!.code == 0) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      // Get.back();
      // message.value = error.toString();
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
      // showDialog(
      //   context: Get.context!,
      //   builder: (context) {
      //     return SimpleDialog(
      //       title: Text('خطا'),
      //       contentPadding: EdgeInsets.all(20),
      //       children: [Text(error.toString())],
      //     );
      //   },
      // );
    }
  }
}

