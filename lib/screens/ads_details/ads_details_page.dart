import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ads_details_controller.dart';

class AdsDetails extends StatelessWidget {
  const AdsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Obx(
          () => Get.find<AdsDetailsController>().isDataLoading.value
              ? const SpinKitThreeBounce(
                  size: 25,
                  color: Color(0xffC42127),
                  duration: Duration(
                    seconds: 1,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 4 / 10,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            Get.find<AdsDetailsController>()
                                    .adsDetailsData!
                                    .data![0]
                                    .imageUrl
                                    .toString()
                                    .startsWith('https://newagahi.ir')
                                ? Get.find<AdsDetailsController>()
                                    .adsDetailsData!
                                    .data![0]
                                    .imageUrl
                                    .toString()
                                : 'https://newagahi.ir${Get.find<AdsDetailsController>().adsDetailsData!.data![0].imageUrl.toString()}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Get.find<AdsDetailsController>()
                                .adsDetailsData!
                                .data![0]
                                .title
                                .toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${Get.find<AdsDetailsController>().adsDetailsData!.data![0].updatedAt} در ${Get.find<AdsDetailsController>().adsDetailsData!.data![0].state}',
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'قیمت',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                Get.find<AdsDetailsController>()
                                            .adsDetailsData!
                                            .data![0]
                                            .price ==
                                        0
                                    ? 'توافقی'
                                    : '${Get.find<AdsDetailsController>().adsDetailsData!.data![0].price} تومان',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'دسته بندی',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                Get.find<AdsDetailsController>()
                                    .adsDetailsData!
                                    .data![0]
                                    .category
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'توضیحات',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            removeAllHtmlTags(
                              Get.find<AdsDetailsController>()
                                      .adsDetailsData!
                                      .data![0]
                                      .description ??
                                  "ندارد",
                            ),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              // color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: Get.height / 12,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffC42127),
            elevation: 0,
          ),
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: Get.height * 3 / 7,
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
                              'اطلاعات تماس',
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
                              title: Text(Get.find<AdsDetailsController>()
                                  .adsDetailsData!
                                  .data![0]
                                  .owner!
                                  .phone
                                  .toString()),
                              leading: const Icon(
                                Icons.phone,
                                color: Color(0xffC42127),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              title: Text(Get.find<AdsDetailsController>()
                                  .adsDetailsData!
                                  .data![0]
                                  .owner!
                                  .email
                                  .toString()),
                              leading: const Icon(
                                Icons.email_outlined,
                                color: Color(0xffC42127),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              title: Text(Get.find<AdsDetailsController>()
                                      .adsDetailsData!
                                      .data![0]
                                      .owner!
                                      .address ??
                                  Get.find<AdsDetailsController>()
                                      .adsDetailsData!
                                      .data![0]
                                      .city
                                      .toString()),
                              leading: const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xffC42127),
                              ),
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
          child: const Text(
            'اطلاعات تماس',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}
