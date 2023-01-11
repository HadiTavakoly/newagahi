import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newagahi/screens/edite_ads/edite_ads_controller.dart';
import '../../constans.dart';
import '../category/category_page.dart';
import '../plans/plan_controller.dart';
import '../state/select_state_page.dart';

class EditeAdsPage extends GetView<EditeAdsController> {
  const EditeAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ویرایش آگهی',
        ),
      ),
      body: SingleChildScrollView(
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
                  // leading: Icon(
                  //   icon,
                  // ),
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
                    Get.to(const CategoryPage());
                  },
                ),
                divider(),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),

                  title: const Text('انتخاب شهر'),
                  // leading: Icon(
                  //   icon,
                  // ),
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
                    Get.to(const SelectStatePage());
                  },
                ),
                divider(),

                reqInfo('عنوان آگهی'),
                reqInfoDescrieption(
                  'در عنوان آگهی به موارد مهم و چشمگیر اشاره کنید.',
                ),
                TextFormField(
                  // initialValue: controller.myAdsData.data![0].title??'',
                  controller: controller.adsTitle,
                  style: const TextStyle(fontSize: 20),
                  cursorColor: const Color(0xffC42127),
                ),
                reqInfo('عکس آگهی'),
                reqInfoDescrieption(
                  'افزودن عکس بازدید آگهی شما را افزایش می دهد.',
                ),
                GestureDetector(
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
                                        controller.getImage(ImageSource.camera);
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
                                        controller
                                            .getImage(ImageSource.gallery);
                                        Get.back();
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
                    height: Get.width / 3,
                    width: Get.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.imagePath.value == ''
                        ? const Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: FileImage(
                                  File(controller.imagePath.value),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                reqInfo('توضیحات آگهی'),
                reqInfoDescrieption(
                  'جزئیات و نکات جالب توجه آگهی خود را کامل و دقیق بنویسید. حتما به ساعت پاسخگویی خود اشاره کنید.',
                ),
                TextFormField(
                  // initialValue: controller.myAdsData.data![0].description??'',
                  controller: controller.adsDescription,
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
                TextField(
                  controller: controller.adsPrice,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    hintText: 'توافقی',
                  ),
                  cursorColor: const Color(0xffC42127),
                  minLines: null,
                  maxLines: null,
                ),
                reqInfo('اطلاعات فروشنده'),
                divider(),
                sellerInfo(
                  'نام',
                  controller.adsOwnerName,
                  TextInputType.name,
                ),
                sellerInfo(
                  'شماره تلفن',
                  controller.adsOwnerPhone,
                  TextInputType.phone,
                ),
                // sellerInfo('ایمیل',),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: controller.adsOwnerAddress,
                    // style: const TextStyle(fontSize: 20),
                    cursorColor: const Color(0xffC42127),
                    decoration: const InputDecoration(
                      hintText: 'آدرس',
                    ),
                    minLines: 3,
                    maxLines: 10,
                  ),
                ),

                // reqInfo('آگهی خود را ویژه کنید'),
                // reqInfoDescrieption(
                //   'با ثبت آگهی ستاره دار شانس دیده شدن آگهی خود را چند برار کنید.',
                // ),
                // divider(),
                // plans(0),
                // plans(1),
                // plans(2),
                // plans(3),
                // plans(4),
                // plans(5),
                // plans(6),
                // plans(7),
                // plans(8),

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
                      controller.updateMyAds(
                        controller.myAdsData.data![0].id.toString(),
                      );
                    },
                    child: const Text(
                      'ثبت آگهی',
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

  Padding sellerInfo(String title, controller, keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          hintText: title,
        ),
      ),
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
