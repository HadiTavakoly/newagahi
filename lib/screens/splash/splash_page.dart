import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/dashbord/dashbord_page.dart';
import 'package:newagahi/screens/login/login_page.dart';
import 'package:newagahi/screens/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Center(
        child: Column(
          children: [
            Container(
              height: Get.height / 2,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/LOGO.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const SpinKitThreeBounce(
              size: 25,
              color: Color(0xffC42127),
              duration: Duration(
                seconds: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
