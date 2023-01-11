import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashbord_controller.dart';
import '../home/home_page.dart';
import '../category/category_page.dart';
import '../profile/profile_page.dart';
import '../splash/auth_controller.dart';
import '../login/login_page.dart';
import '../ads_register/ads_register_page.dart';
import '../plans/plan_page.dart';

class DashbordPage extends GetView<DashbordController> {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().checkLoginStatus();
    return Obx(
      (() => Scaffold(
            body: Center(
              child: IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomePage(),
                  const CategoryPage(),
                  Get.find<AuthController>().isLogged.value
                      ?  const AdsRegisterPage()
                      : LoginPage(),
                  const PlanPage(),
                  const ProfilePage(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.tabIndex.value,
              onTap: (value) {
                controller.tabIndex.value = value;
              },
              selectedItemColor: const Color(0xffC42127),
              unselectedItemColor: const Color(0xff595A5C),
              unselectedLabelStyle: const TextStyle(color: Color(0xff707070)),
              showUnselectedLabels: true,
              items: [
                _bottomNavigationBarItem(Icons.note, 'آگهی ها'),
                _bottomNavigationBarItem(Icons.list, 'دسته ها'),
                _bottomNavigationBarItem(Icons.add_circle, 'ثبت آگهی'),
                _bottomNavigationBarItem(Icons.chat, 'چت'),
                _bottomNavigationBarItem(Icons.person, 'دیوار من'),
              ],
            ),
          )),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
          IconData icon, String label) =>
      BottomNavigationBarItem(
        icon: Icon(icon),
        label: label,
      );
}
