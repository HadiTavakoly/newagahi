import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newagahi/screens/my_ads/my_ads_page.dart';
import 'package:newagahi/screens/profile/profile_controller.dart';
import '../splash/auth_controller.dart';
import '../login/login_page.dart';
import '../login/login_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
// https://newagahi.ir/pages?page=%D9%82%D9%88%D8%A7%D9%86%DB%8C%D9%86

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
      // webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('پروفایل من')),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Get.find<AuthController>().isLogged.value
                  ? logout()
                  : login(),
            ),
            divider(),
            Obx(
              () => Get.find<AuthController>().isLogged.value
                  ? Column(
                      children: [
                        cell(
                          'آگهی های من',
                          Icons.person,
                          () {
                            Get.to(
                              () => MyAdsPage(),
                            );
                          },
                        ),
                        divider(),
                      ],
                    )
                  : const SizedBox(),
            ),
            cell('تنظیمات', Icons.settings, () {}),
            divider(),
            cell(
              'پشتیبانی و قوانین',
              Icons.headset_mic_outlined,
              () {
                _launchUrl(
                  Uri.parse(
                    'https://newagahi.ir/pages?page=%D9%82%D9%88%D8%A7%D9%86%DB%8C%D9%86',
                  ),
                );
              },
            ),
            const Spacer(),
            const ListTile(
              title: Text('نسخه'),
              trailing: Text('1.0.0'),
            )
          ],
        ),
      ),
    );
  }

  Padding logout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: Get.height / 8,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'شما با شماره موبایل ${Get.find<AuthController>().getTel()} وارد شده اید و آگهی های ثبت شده با این شماره را مشاهده می کنید.',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      'خروج از حساب',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: Get.height / 5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'آیا مایل به خروج از حساب کاربری خود هستید؟',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            const Spacer(),
                            divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    height: Get.height / 12,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: const BorderSide(
                                            color: Color(0xffC42127),
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'نه',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffC42127),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    height: Get.height / 12,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side: const BorderSide(
                                            color: Color(0xffC42127),
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        Get.find<AuthController>().logOut();

                                        Get.back();
                                      },
                                      child: const Text(
                                        'بله',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffC42127)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding login() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SizedBox(
        height: Get.height / 8,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'برای استفاده از تمام امکانات ، لطفا وارد حساب کاربری خود شوید.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      'ورود به حساب',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(LoginPage());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile cell(String title, IconData icon, onTap) {
    return ListTile(
        minLeadingWidth: 0,
        title: Text(title),
        leading: Icon(
          icon,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 15,
        ),
        onTap: onTap);
  }

  Divider divider() {
    return Divider(
      thickness: 1,
      height: 0,
      indent: 15,
      endIndent: 15,
      color: Colors.grey.shade200,
    );
  }
}
