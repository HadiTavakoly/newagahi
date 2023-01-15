import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/register/register_page.dart';
import '../login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ورود به حساب کاربری'),
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
                  'برای استفاده از امکانات ویژه، لطفا وارد حساب کاربری خود شوید.',
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
                  cursorColor: const Color(0xffC42127),
                  controller: controller.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'نام کاربری',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => TextField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: const Color(0xffC42127),
                    obscureText: Get.find<LoginController>().obscure.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Get.find<LoginController>().obscure.value
                            ? _suffixIcon = const Icon(
                                Icons.lock_outlined,
                                color: Color(0xffC42127),
                              )
                            : _suffixIcon = const Icon(
                                Icons.lock_open_outlined,
                                color: Color(0xffC42127),
                              ),
                        onTap: () {
                          Get.find<LoginController>().obscure.value
                              ? Get.find<LoginController>().obscure.value =
                                  false
                              : Get.find<LoginController>().obscure.value =
                                  true;
                        },
                      ),
                      labelText: 'رمز',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Visibility(
                    visible: controller.visible.value,
                    child: GestureDetector(
                      child: const Text(
                        'پاک کردن فرم',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: () {
                        controller.usernameController.clear();
                        controller.passwordController.clear();
                        controller.message.value = '';
                        controller.visible.value = false;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text(
                    controller.message.value,
                    style: const TextStyle(
                      color: Color(0xffC42127),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: Get.height / 12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC42127),
                  elevation: 0,
                ),
                onPressed: () {
                  Get.to(RegisterPage());
                },
                child: const Text(
                  'حساب جدید',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: Get.height / 12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffC42127),
                  elevation: 0,
                ),
                onPressed: () {
                  controller.loginWithEmail();
                },
                child: const Text(
                  'ورود',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _suffixIcon = Icon(
  Icons.lock_outline,
  color: primaryColor,
);
