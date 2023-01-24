import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/constans.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/category/category_controller.dart';
import 'package:newagahi/screens/plans/plan_controller.dart';
import 'package:newagahi/screens/state/select_state_page.dart';
import 'package:get/get.dart';
import 'package:newagahi/screens/state/state_controller.dart';
import '../dashbord/dashbord_controller.dart';
import '../category/category_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdsRegisterPage extends StatelessWidget {
  AdsRegisterPage({super.key});

  var controller = Get.put(AdsRegisterController());

  refresh() {
    controller.categoryId.value = 0;
    controller.cityId.value = 0;
    controller.adsTitle.value = '';
    controller.adsDescription.value = '';
    controller.adsPrice.value = '0';
    controller.adsOwnerName.value = '';
    controller.adsOwnerPhone.value = '';
    controller.adsOwnerAddress.value = '';
    controller.imagePath1.value = '';
    controller.imagePath2.value = '';
    controller.imagePath3.value = '';
    controller.imagePath4.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          Get.arguments?[0] != 'edit' ? 'ثبت آگهی' : 'ویرایش آگهی',
        ),
        leading: Get.arguments?[0] != 'edit'
            ? GestureDetector(
                onTap: () {
                  Get.find<DashbordController>().tabIndex.value = 0;
                },
                child: const Icon(
                  Icons.close_outlined,
                ),
              )
            : GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
        actions: [
          Get.arguments?[0] != 'edit'
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.refresh,
                    ),
                    onTap: () {
                      refresh();
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const SpinKitThreeBounce(
                size: 25,
                color: Color(0xffC42127),
                duration: Duration(
                  seconds: 1,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('دسته بندی'),
                          trailing: Obx(
                            () => Text(
                              controller.categoryId.value == 0
                                  ? 'دسته بندی اصلی'
                                  : '${controller.categoryName.value} | ${controller.subCategoryName.value}',
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.delete<CategoryController>();
                            Get.to(
                              () => CategoryPage(),
                              arguments: 'false',
                              binding: MyBinding(),
                            );
                          },
                        ),
                        divider(),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('انتخاب شهر'),
                          trailing: Obx(
                            () => Text(
                              controller.cityId.value == 0
                                  ? 'انتخاب شهر'
                                  : controller.cityName.value,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.delete<StateController>();
                            Get.to(
                              () => SelectStatePage(),
                              binding: MyBinding(),
                              arguments: 'false',
                            );
                          },
                        ),
                        divider(),
                        reqInfo('عنوان آگهی'),
                        reqInfoDescrieption(
                          'در عنوان آگهی به موارد مهم و چشمگیر اشاره کنید.',
                        ),
                        TextFormField(
                          initialValue: controller.adsTitle.value,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: const Color(0xffC42127),
                          onChanged: (String value) {
                            controller.adsTitle.value = value;
                          },
                        ),
                        reqInfo('عکس آگهی'),
                        reqInfoDescrieption(
                          'افزودن عکس بازدید آگهی شما را افزایش می دهد',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addImage(controller.imagePath1.value, 1),
                            addImage(controller.imagePath2.value, 2),
                            addImage(controller.imagePath3.value, 3),
                            addImage(controller.imagePath4.value, 4),
                          ],
                        ),
                        reqInfo('توضیحات آگهی'),
                        reqInfoDescrieption(
                          'جزئیات و نکات جالب توجه آگهی خود را کامل و دقیق بنویسید. حتما به ساعت پاسخگویی خود اشاره کنید.',
                        ),
                        TextFormField(
                          initialValue: removeAllHtmlTags(
                              controller.adsDescription.value),
                          onChanged: (String value) {
                            controller.adsDescription.value = value;
                          },
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: const Color(0xffC42127),
                          minLines: null,
                          maxLines: null,
                        ),
                        reqInfo('قیمت'),
                        reqInfoDescrieption(
                          'اگر قیمت آگهی شما توافقی است این فیلد را پر نکنید.',
                        ),
                        TextFormField(
                          initialValue: controller.adsPrice.value == '0'
                              ? 'توافقی'
                              : controller.adsPrice.value,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            hintText: 'توافقی',
                          ),
                          cursorColor: const Color(0xffC42127),
                          minLines: null,
                          maxLines: null,
                          onChanged: (String value) {
                            controller.adsPrice.value = value;
                          },
                        ),
                        reqInfo('اطلاعات فروشنده'),
                        divider(),
                        sellerInfo(
                          'نام',
                          controller.adsOwnerName.value,
                          TextInputType.name,
                          (String value) {
                            controller.adsOwnerName.value = value;
                          },
                        ),
                        sellerInfo(
                          'شماره تلفن',
                          controller.adsOwnerPhone.value,
                          TextInputType.phone,
                          (String value) {
                            controller.adsOwnerPhone.value = value;
                          },
                        ),
                        sellerInfo(
                          'ایمیل',
                          controller.adsOwnerEmail.value,
                          TextInputType.emailAddress,
                          (String value) {
                            controller.adsOwnerEmail.value = value;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            initialValue: controller.adsOwnerAddress.value,
                            cursorColor: const Color(0xffC42127),
                            decoration: const InputDecoration(
                              hintText: 'آدرس',
                            ),
                            minLines: 3,
                            maxLines: 10,
                            onChanged: (String value) {
                              controller.adsOwnerAddress.value = value;
                            },
                          ),
                        ),
                        ExpansionTile(
                          title: ListTile(
                            title: reqInfo('آگهی خود را ویژه کنید'),
                            subtitle: reqInfoDescrieption(
                              'با ثبت آگهی ستاره دار شانس دیده شدن آگهی خود را چند برار کنید.',
                            ),
                          ),
                          tilePadding: const EdgeInsets.all(0),
                          children: [
                            plans(0),
                            plans(1),
                            plans(2),
                            plans(3),
                            plans(4),
                            plans(5),
                            plans(6),
                            plans(7),
                            plans(8),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          width: Get.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: const Color(0xffC42127),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Get.arguments?[0] != 'edit'
                                  ? controller.registrAds()
                                  : controller.updateMyAds(
                                      int.parse(controller.adsId.value));
                            },
                            child: Text(
                              controller.editeMode.value != 'edit'
                                  ? 'ثبت آگهی'
                                  : 'ویرایش آگهی',
                              style: const TextStyle(
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
      ),
    );
  }

  GestureDetector addImage(imagePath, int id) {
    return GestureDetector(
      onLongPress: () {
        if (id == 1) {
          controller.imagePath1.value = '';
        } else if (id == 2) {
          controller.imagePath2.value = '';
        } else if (id == 3) {
          controller.imagePath3.value = '';
        } else {
          controller.imagePath4.value = '';
        }
      },
      onTap: () {
        Get.bottomSheet(
          Container(
            height: Get.height / 4,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 4,
                    width: Get.width / 14,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'انتخاب عکس',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        ListTile(
                          horizontalTitleGap: 0,
                          title: const Text('از دوربین'),
                          leading: const Icon(
                            Icons.photo_camera,
                            color: Color(0xffC42127),
                          ),
                          onTap: () {
                            controller.getImage(ImageSource.camera, id);
                            Get.back();
                          },
                        ),
                        ListTile(
                          horizontalTitleGap: 0,
                          title: const Text('از گالری'),
                          leading: const Icon(
                            Icons.image,
                            color: Color(0xffC42127),
                          ),
                          onTap: () {
                            controller.getImage(ImageSource.gallery, id);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        height: Get.width / 5,
        width: Get.width / 5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: imagePath == ''
            ? const Icon(
                Icons.add_a_photo_outlined,
                size: 30,
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(
                      File(imagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }

  plans(int index) {
    return Obx(
      () => Get.find<PlanController>().isDataLoading.value
          ? CircularProgressIndicator(
              color: primaryColor,
            )
          : RadioListTile(
              activeColor: primaryColor,
              value: index + 1,
              groupValue: controller.planId.value,
              onChanged: (value) {
                controller.planId.value = value!;
              },
              title: Text(
                Get.find<PlanController>()
                    .planData!
                    .data![index]
                    .planTitle
                    .toString(),
              ),
              subtitle: Text(
                Get.find<PlanController>().planData!.data![index].planPrice == 0
                    ? 'رایگان'
                    : '${Get.find<PlanController>().planData!.data![index].planPrice} تومان',
              ),
            ),
    );
  }

  Padding reqInfoDescrieption(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

  Padding sellerInfo(String title, String initialValue,
      TextInputType keyboardType, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: title,
          ),
          onChanged: onChanged),
    );
  }

  Padding reqInfo(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Divider divider() {
    return Divider(
      thickness: 1,
      height: 0,
      indent: 0,
      endIndent: 0,
      color: Colors.grey.shade300,
    );
  }
}
