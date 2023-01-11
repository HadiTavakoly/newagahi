import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newagahi/models/auth_model.dart';

class RegisterController extends GetxController {
  Auth? registerData;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  var checkBox = false.obs;

  Future<void> register() async {
    try {
      var response = await http.post(
        Uri.https(
          'newagahi.ir',
          'api/v1/auth/register',
        ),
        body: {
          'NAME': nameController.text,
          'EMAIL': emailController.text,
          'USERNAME': usernameController.text,
          'TEL': phoneController.text,
          'PASSWORD': passwordController.text,
          'PASSWORD_confirmation': passwordConfirmationController.text,
          'terms': checkBox.value ? '1' : '0',
        },
      );

      if (response.statusCode == 200) {
        registerData = Auth.fromJson(jsonDecode(response.body));

        if (registerData!.code == 1) {
          Get.back();
          nameController.clear();
          emailController.clear();
          usernameController.clear();
          phoneController.clear();
          passwordController.clear();
          passwordConfirmationController.clear();
          checkBox.value = false;
          throw 1;
        } else if (registerData!.code == 0) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      if (error.toString() == '1') {
        Get.snackbar(
          '',
          '',
          titleText: const Text(
            'حساب کاربری با موفقیت ایجاد شد',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 22,
            ),
          ),
          messageText: Text(
            'برای ورود اطلاعات خود را وارد کنید',
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
  }
}
