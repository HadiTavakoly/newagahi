import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../models/register_model.dart';
import 'package:newagahi/screens/splash/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsRegisterController extends GetxController {
  Register? adsRegistrData;
  var imagePath = ''.obs;
  var isLoading = false.obs;
  var categoryId = 0.obs;
  var categoryName = ''.obs;
  var subCategoryName = ''.obs;
  var stateId = 0.obs;
  var cityId = 0.obs;
  var cityName = ''.obs;
  var planId = 1.obs;

  
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      // mode: LaunchMode.platformDefault,
      // webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  TextEditingController adsTitle = TextEditingController();
  TextEditingController adsDescription = TextEditingController();
  TextEditingController adsPrice = TextEditingController();
  TextEditingController adsOwnerName = TextEditingController();
  TextEditingController adsOwnerPhone = TextEditingController();
  TextEditingController adsOwnerAddress = TextEditingController();

  Future<void> registrAds() async {
    // var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      var response = await http.post(
        Uri.https(
          'newagahi.ir',
          'api/v1/ads/create',
        ),
        body: {
          'api_token': Get.find<AuthController>().getToken(),
          'ADS_TITLE': adsTitle.text,
          'ADS_DESCRIPTION': adsDescription.text,
          'ADS_PRICE': adsPrice.text,
          'STATE_ID':
              stateId.value.toString() == '0' ? '' : stateId.value.toString(),
          'CITY_ID':
              cityId.value.toString() == '0' ? '' : cityId.value.toString(),
          'CATEGORY_ID': categoryId.value.toString(),
          'ADS_OWNER_PHONE': adsOwnerPhone.text,
          'ADS_OWNER_ADDRESS': adsOwnerAddress.text,
          'special': planId.value.toString(),
        },
      );

      if (response.statusCode == 200) {
        adsRegistrData = Register.fromJson(jsonDecode(response.body));

        if (adsRegistrData!.code == 1) {
          categoryId.value = 0;
          cityId.value = 0;
          adsTitle.clear();
          adsDescription.clear();
          adsPrice.clear();
          adsOwnerName.clear();
          adsOwnerPhone.clear();
          adsOwnerAddress.clear();
          if (adsRegistrData!.data!.isNotEmpty) {
            throw 1;
          }
          throw 2;
        } else if (adsRegistrData!.code == 0) {
          isLoading(false);
          throw adsRegistrData!.message.toString();
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      if (error.toString() == '1') {
        Get.snackbar(
          '',
          '',
          titleText: Text(
            adsRegistrData!.message.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          messageText: const Text(
            'منتظر بمانید',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 17,
            ),
          ),
          icon: GestureDetector(
            child: const Icon(Icons.arrow_back_ios_new),
            onTap: () {},
          ),
          duration: const Duration(seconds: 10),
        );
        Timer(
          const Duration(seconds: 3),
          (() {
            _launchUrl(
              Uri.parse(
                adsRegistrData!.data![0].link.toString(),
              ),
            );
          }),
        );
      } else if (error.toString() == '2') {
        Get.snackbar(
          '',
          '',
          titleText: const Text(
            'توجه',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          messageText: Text(
            adsRegistrData!.message.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
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
    } finally {
      isLoading(false);
    }
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    } else {
      Get.snackbar('توجه', 'عکسی انتخاب نشد');
    }
  }
}
