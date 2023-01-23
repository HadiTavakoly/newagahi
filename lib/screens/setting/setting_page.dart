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
      body: ListTile(
        minLeadingWidth: 0,
        title: const Text('تغییر رمز'),
        leading: const Icon(
          Icons.lock,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 15,
        ),
        onTap: () {},
      ),
    );
  }
}
