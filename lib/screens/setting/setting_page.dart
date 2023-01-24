import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/ads_register/ads_register_page.dart';
import 'package:newagahi/screens/my_ads/my_ads_controller.dart';
import 'package:newagahi/screens/register/register_page.dart';
import 'package:newagahi/screens/setting/setting_controller.dart';
import '../../bindings/my_binding.dart';
import '../ads_details/ads_details_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../dashbord/auth_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تنظیمات',
        ),
      ),
      body: Obx(
        () => Get.find<AuthController>().isLogged.value
            ? ListTile(
                minLeadingWidth: 0,
                title: const Text('تغییر رمز'),
                leading: const Icon(
                  Icons.lock,
                ),
                trailing: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15,
                ),
                onTap: () {
                  Get.to(
                    () => const ChangePasswordPage(),
                    binding: MyBinding(),
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}

class ChangePasswordPage extends GetView<SettingController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تغییر رمز',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'برای تغییر رمز عبور خود ، فیلد های زیر را با دقت تکمیل نمایید.',
                  style: TextStyle(
                    fontSize: 20,
                    // color: Colors.grey,
                  ),
                  // textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  cursorColor: primaryColor,
                  controller: controller.oldPassword,
                  decoration: const InputDecoration(
                    labelText: 'رمزعبور قبلی',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  cursorColor: primaryColor,
                  controller: controller.newPassword,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'رمزعبور جدید',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(fontSize: 20),
                  cursorColor: primaryColor,
                  controller: controller.newPasswordConfirmation,
                  decoration: const InputDecoration(
                    labelText: 'تکرار رمزعبور',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: primaryColor,
                      elevation: 0,
                    ),
                    onPressed: () {
                      controller.changePassword();
                    },
                    child: const Text(
                      'به روز رسانی رمز عبور',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
