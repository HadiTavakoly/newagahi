import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:newagahi/models/auth_model.dart';
import 'package:newagahi/screens/dashbord/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsRegisterController extends GetxController {
  Auth? adsRegistrData;
  var imagePath1 = ''.obs;
  var imagePath2 = ''.obs;
  var imagePath3 = ''.obs;
  var imagePath4 = ''.obs;
  var isLoading = false.obs;
  var categoryId = 0.obs;
  var categoryName = ''.obs;
  var subCategoryName = ''.obs;
  var stateId = 0.obs;
  var cityId = 0.obs;
  var cityName = ''.obs;
  var planId = 1.obs;
  var editeMode = ''.obs;
  var adsTitle = ''.obs;
  var adsDescription = ''.obs;
  var adsPrice = ''.obs;
  var adsId = ''.obs;
  var adsOwnerName = ''.obs;
  var adsOwnerPhone = ''.obs;
  var adsOwnerAddress = ''.obs;
  var adsOwnerEmail = ''.obs;

  @override
  Future<void> onInit() async {
    List arg = Get.arguments ?? [];
    super.onInit();
    if (arg.isNotEmpty) {
      editeMode.value = arg[0] ?? '';
      adsTitle.value = arg[1] ?? '';
      adsDescription.value = arg[2] ?? '';
      adsId.value = arg[3].toString();
      adsPrice.value = arg[4].toString();
      adsOwnerName.value = arg[5] ?? '';
      adsOwnerPhone.value = arg[6] ?? '';
      adsOwnerAddress.value = arg[7] ?? '';
      adsOwnerEmail.value = arg[8] ?? '';
    }
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }

  void refreshFields() {
    categoryId.value = 0;
    cityId.value = 0;
    adsTitle.value = '';
    adsDescription.value = '';
    adsPrice.value = '0';
    adsOwnerName.value = '';
    adsOwnerPhone.value = '';
    adsOwnerEmail.value = '';
    adsOwnerAddress.value = '';
    imagePath1.value = '';
    imagePath2.value = '';
    imagePath3.value = '';
    imagePath4.value = '';
  }

  Future<void> registrAds() async {
    try {
      isLoading(true);
      // var response = await http.post(
      //   Uri.https(
      //     'newagahi.ir',
      //     'api/v1/ads/create',
      //   ),
      //   body: {
      //     'api_token': Get.find<AuthController>().getToken(),
      //     'ADS_TITLE': adsTitle.value,
      //     'ADS_DESCRIPTION': adsDescription.value,
      //     'ADS_PRICE': adsPrice.value,
      //     'STATE_ID':
      //         stateId.value.toString() == '0' ? '' : stateId.value.toString(),
      //     'CITY_ID':
      //         cityId.value.toString() == '0' ? '' : cityId.value.toString(),
      //     'CATEGORY_ID': categoryId.value.toString(),
      //     'ADS_OWNER_NAME': adsOwnerName.value,
      //     'ADS_OWNER_PHONE': adsOwnerPhone.value,
      //     'ADS_OWNER_ADDRESS': adsOwnerAddress.value,
      //     'special': planId.value.toString(),
      //   },
      // );
//------------------------------------------------------------------------------
      Map<String, String> body = {
        'api_token': Get.find<AuthController>().getToken().toString(),
        'ADS_TITLE': adsTitle.value,
        'ADS_DESCRIPTION': adsDescription.value,
        'ADS_PRICE': adsPrice.value,
        'STATE_ID':
            stateId.value.toString() == '0' ? '' : stateId.value.toString(),
        'CITY_ID':
            cityId.value.toString() == '0' ? '' : cityId.value.toString(),
        'CATEGORY_ID': categoryId.value.toString(),
        'ADS_OWNER_NAME': adsOwnerName.value,
        'ADS_OWNER_PHONE': adsOwnerPhone.value,
        'ADS_OWNER_ADDRESS': adsOwnerAddress.value,
        'special': planId.value.toString(),
      };
      var req = http.MultipartRequest(
        'POST',
        Uri.https(
          'newagahi.ir',
          'api/v1/ads/create',
        ),
      );
      if (imagePath1.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath1.value,
            ),
          ],
        );
      }
      if (imagePath2.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath2.value,
            ),
          ],
        );
      }
      if (imagePath3.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath3.value,
            ),
          ],
        );
      }
      if (imagePath4.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath4.value,
            ),
          ],
        );
      }

      req.fields.addAll(body);

      var response = await req.send();
      final responseBody = await response.stream.bytesToString();
//------------------------------------------------------------------------------
      if (response.statusCode == 200) {
        adsRegistrData = Auth.fromJson(jsonDecode(responseBody));

        if (adsRegistrData!.code == 1) {
          refreshFields();
          if (adsRegistrData!.data!.isNotEmpty) {
            throw 1;
          }
          throw 2;
        } else if (adsRegistrData!.code == 0) {
          isLoading(false);
          throw adsRegistrData!.message.toString();
        }
      } else {
        throw jsonDecode(responseBody)["message"] ?? "Unknown Error Occured";
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
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateMyAds(int id) async {
    try {
      isLoading(true);
      // var response = await http.post(
      //   Uri.https(
      //     'newagahi.ir',
      //     'api/v1/panel/ads/update/$id',
      //   ),
      //   body: {
      //     'api_token': Get.find<AuthController>().getToken(),
      //     'ADS_TITLE': adsTitle.value,
      //     'ADS_DESCRIPTION': adsDescription.value,
      //     'ADS_OWNER_NAME': adsOwnerName.value,
      //     'ADS_OWNER_EMAIL': adsOwnerEmail.value,
      //     'ADS_PRICE': adsPrice.value,
      //     'STATE_ID':
      //         stateId.value.toString() == '0' ? '' : stateId.value.toString(),
      //     'CITY_ID':
      //         cityId.value.toString() == '0' ? '' : cityId.value.toString(),
      //     'CATEGORY_ID': categoryId.value.toString(),
      //     'ADS_OWNER_PHONE': adsOwnerPhone.value,
      //     'ADS_OWNER_ADDRESS': adsOwnerAddress.value,
      //     'special': planId.value.toString(),
      //   },
      // );

//------------------------------------------------------------------------------

      Map<String, String> body = {
        'api_token': Get.find<AuthController>().getToken().toString(),
        'ADS_TITLE': adsTitle.value,
        'ADS_DESCRIPTION': adsDescription.value,
        'ADS_OWNER_NAME': adsOwnerName.value,
        'ADS_OWNER_EMAIL': adsOwnerEmail.value,
        'ADS_PRICE': adsPrice.value,
        'STATE_ID':
            stateId.value.toString() == '0' ? '' : stateId.value.toString(),
        'CITY_ID':
            cityId.value.toString() == '0' ? '' : cityId.value.toString(),
        'CATEGORY_ID': categoryId.value.toString(),
        'ADS_OWNER_PHONE': adsOwnerPhone.value,
        'ADS_OWNER_ADDRESS': adsOwnerAddress.value,
        'special': planId.value.toString(),
      };

      var req = http.MultipartRequest(
        'POST',
        Uri.https(
          'newagahi.ir',
          'api/v1/panel/ads/update/$id',
        ),
      );
      if (imagePath1.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath1.value,
            ),
          ],
        );
      }
      if (imagePath2.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath2.value,
            ),
          ],
        );
      }
      if (imagePath3.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath3.value,
            ),
          ],
        );
      }
      if (imagePath4.value != '') {
        req.files.addAll(
          [
            await http.MultipartFile.fromPath(
              'images[]',
              imagePath4.value,
            ),
          ],
        );
      }

      req.fields.addAll(body);

      var response = await req.send();
      final responseBody = await response.stream.bytesToString();
//------------------------------------------------------------------------------

      if (response.statusCode == 200) {
        adsRegistrData = Auth.fromJson(jsonDecode(responseBody));

        if (adsRegistrData!.code == 1) {
          refreshFields();

          if (adsRegistrData!.data!.isNotEmpty) {
            throw 1;
          }
          throw 2;
        } else if (adsRegistrData!.code == 0) {
          isLoading(false);
          throw adsRegistrData!.message.toString();
        }
      } else {
        throw jsonDecode(responseBody)["message"] ?? "Unknown Error Occured";
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
    } finally {
      isLoading(false);
    }
  }

  void getImage(ImageSource imageSource, int imagePathId) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      if (imagePathId == 1) {
        imagePath1.value = pickedFile.path;
      } else if (imagePathId == 2) {
        imagePath2.value = pickedFile.path;
      } else if (imagePathId == 3) {
        imagePath3.value = pickedFile.path;
      } else {
        imagePath4.value = pickedFile.path;
      }
    } else {
      Get.snackbar('توجه', 'عکسی انتخاب نشد');
    }
  }
}
