import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ساخت حساب جدید',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'برای ساخت حساب جدید فیلد های زیر را با دقت تکمیل نمایید.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                infoField('نام', controller.nameController,
                    TextInputType.name, false),
                infoField('نام کاربری', controller.usernameController,
                    TextInputType.name, false),
                infoField('شماره موبایل', controller.phoneController,
                    TextInputType.phone, false),
                infoField('ایمیل', controller.emailController,
                    TextInputType.emailAddress, false),
                infoField('رمز عبور', controller.passwordController,
                    TextInputType.visiblePassword, true),
                infoField(
                    'تایید رمز عبور',
                    controller.passwordConfirmationController,
                    TextInputType.visiblePassword,
                    true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Obx(
                          () => Checkbox(
                            value:
                                Get.find<RegisterController>().checkBox.value,
                            onChanged: (bool? value) {
                              Get.find<RegisterController>().checkBox.value =
                                  value!;
                            },
                            activeColor: const Color(0xffC42127),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'با قوانین و مقررات موافقم',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 13,
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffC42127),
                      elevation: 0,
                    ),
                    child: const Text(
                      'ثبت نام',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Get.find<RegisterController>().register();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding infoField(String hintText, TextEditingController controller,
      TextInputType keyboardType, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        style: const TextStyle(fontSize: 20),
        cursorColor: const Color(0xffC42127),
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
