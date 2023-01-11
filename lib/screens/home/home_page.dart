import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newagahi/bindings/my_binding.dart';
import 'package:newagahi/screens/ads_register/ads_register_controller.dart';
import 'package:newagahi/screens/city/city_controller.dart';
import 'package:newagahi/screens/home/ads_controller.dart';
import 'package:newagahi/screens/ads_details/ads_details_page.dart';
import '../category/category_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../subcategory/subcategory_page.dart';
import '../state/select_state_page.dart';
import '../../constans.dart';

class HomePage extends GetResponsiveView {
  HomePage({super.key});

  final formatter = NumberFormat(
    ',###',
  );

  // @override
  // Widget desktop() {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       backgroundColor: Colors.white,
  //       elevation: 0.5,
  //       title: Row(
  //         children: [
  //           ElevatedButton.icon(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               elevation: 0,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //               foregroundColor: Colors.grey,
  //             ),
  //             onPressed: () {},
  //             icon: const Icon(
  //               size: 20,
  //               Icons.location_on_outlined,
  //               color: Color.fromRGBO(0, 0, 0, 0.56),
  //             ),
  //             label: const Text(
  //               'اصفهان',
  //               style: TextStyle(
  //                 color: Color.fromRGBO(0, 0, 0, 0.56),
  //                 fontWeight: FontWeight.bold,

  //                 // fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton.icon(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               elevation: 0,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //               foregroundColor: Colors.grey,
  //             ),
  //             onPressed: () {},
  //             icon: const Icon(
  //               size: 20,
  //               Icons.person_outline_outlined,
  //               color: Color.fromRGBO(0, 0, 0, 0.56),
  //             ),
  //             label: const Text(
  //               'دیوار من',
  //               style: TextStyle(
  //                 color: Color.fromRGBO(0, 0, 0, 0.56),
  //                 fontWeight: FontWeight.bold,

  //                 // fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton.icon(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               elevation: 0,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //               foregroundColor: Colors.grey,
  //             ),
  //             onPressed: () {},
  //             icon: const Icon(
  //               Icons.chat_outlined,
  //               size: 20,
  //               color: Color.fromRGBO(0, 0, 0, 0.56),
  //             ),
  //             label: const Text(
  //               'چت',
  //               style: TextStyle(
  //                 color: Color.fromRGBO(0, 0, 0, 0.56),
  //                 fontWeight: FontWeight.bold,

  //                 // fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.white,
  //               elevation: 0,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //               foregroundColor: Colors.grey,
  //             ),
  //             onPressed: () {},
  //             child: Text(
  //               'پشتیبانی',
  //               style: TextStyle(
  //                 color: Colors.black.withOpacity(0.5),
  //                 fontWeight: FontWeight.bold,
  //                 // fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: const Color(0xffC42127),
  //               elevation: 0,
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
  //               foregroundColor: Colors.grey,
  //             ),
  //             onPressed: () {},
  //             child: const Text(
  //               'ثبت آگهی',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //                 // fontSize: 15,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     body: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 50),
  //         child: Row(
  //           children: [
  //             SizedBox(
  //               height: Get.height,
  //               width: 350,
  //               // color: Colors.red,
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const SizedBox(
  //                       height: 30,
  //                     ),
  //                     const Text(
  //                       'دسته ها',
  //                     ),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Expanded(
  //                       child: Obx(
  //                         () => Get.find<CategoryController>()
  //                                 .isDataLoading
  //                                 .value
  //                             ? const SpinKitThreeBounce(
  //                                 size: 25,
  //                                 color: Color(0xffC42127),
  //                                 duration: Duration(
  //                                   seconds: 1,
  //                                 ),
  //                               )
  //                             : ListView.builder(
  //                                 padding: const EdgeInsets.all(0),
  //                                 itemCount: Get.find<CategoryController>()
  //                                     .categoriesData!
  //                                     .data!
  //                                     .length,
  //                                 itemBuilder: (context, index) {
  //                                   return ListTile(
  //                                     contentPadding: const EdgeInsets.all(0),
  //                                     minLeadingWidth: 0,
  //                                     leading: FaIcon(
  //                                       getIcon(
  //                                         Get.find<CategoryController>()
  //                                             .categoriesData!
  //                                             .data![index]
  //                                             .icon
  //                                             .toString(),
  //                                       ),
  //                                       color: const Color(0xff595A5C),
  //                                       size: 15,
  //                                     ),
  //                                     title: Text(
  //                                       Get.find<CategoryController>()
  //                                           .categoriesData!
  //                                           .data![index]
  //                                           .name
  //                                           .toString(),
  //                                       style: const TextStyle(
  //                                         fontWeight: FontWeight.w400,
  //                                       ),
  //                                     ),
  //                                   );
  //                                 },
  //                               ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Obx(() => Get.find<AdsController>().isDataLoading.value
  //                   ? const SpinKitThreeBounce(
  //                       size: 25,
  //                       color: Color(0xffC42127),
  //                       duration: Duration(
  //                         seconds: 1,
  //                       ),
  //                     )
  //                   : Expanded(
  //                     child: GridView.builder(
  //                       gridDelegate:
  //                           SliverGridDelegateWithMaxCrossAxisExtent(
  //                         maxCrossAxisExtent: Get.width / 4,
  //                         mainAxisSpacing: 10,
  //                         crossAxisSpacing: 10,
  //                         mainAxisExtent: Get.height / 4,
  //                       ),
  //                       itemCount: Get.find<AdsController>()
  //                           .adsData!
  //                           .data!
  //                           .length,
  //                       itemBuilder: (context, index) {
  //                         return Container(
  //                           padding: const EdgeInsets.all(10),
  //                           decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(5),
  //                             border: Border.all(
  //                               color: Colors.grey.shade300,
  //                             ),
  //                           ),
  //                           child: Row(
  //                             children: [
  //                               Expanded(
  //                                 child: Column(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Text(
  //                                       Get.find<AdsController>()
  //                                           .adsData!
  //                                           .data![index]
  //                                           .titleLimit
  //                                           .toString(),
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: const TextStyle(
  //                                         fontSize: 15,
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     Text(
  //                                       Get.find<AdsController>()
  //                                           .adsData!
  //                                           .data![index]
  //                                           .descriptionLimit
  //                                           .toString(),
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: TextStyle(
  //                                         // fontSize: 15,
  //                                         color: Colors.grey[600],
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     const Spacer(),
  //                                     Text(
  //                                       Get.find<AdsController>()
  //                                                   .adsData!
  //                                                   .data![index]
  //                                                   .price ==
  //                                               0
  //                                           ? 'توافقی'
  //                                           : '${formatter.format(Get.find<AdsController>().adsData!.data![index].price)} تومان',
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: TextStyle(
  //                                         // fontSize: 15,
  //                                         color: Colors.grey[600],
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                     Text(
  //                                       '${Get.find<AdsController>().adsData!.data![index].updatedAt} در ${Get.find<AdsController>().adsData!.data![index].state}',
  //                                       maxLines: 2,
  //                                       overflow: TextOverflow.ellipsis,
  //                                       style: TextStyle(
  //                                         // fontSize: 15,
  //                                         color: Colors.grey[600],
  //                                         fontWeight: FontWeight.bold,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               const SizedBox(
  //                                 width: 10,
  //                               ),
  //                               Expanded(
  //                                 child: Container(
  //                                   // margin: const EdgeInsets.all(10),
  //                                   decoration: BoxDecoration(
  //                                     color: Colors.grey[200],
  //                                     borderRadius:
  //                                         BorderRadius.circular(5),
  //                                     image: DecorationImage(
  //                                       image: NetworkImage(
  //                                         Get.find<AdsController>()
  //                                                 .adsData!
  //                                                 .data![index]
  //                                                 .imageUrl
  //                                                 .toString()
  //                                                 .startsWith(
  //                                                     'https://newagahi.ir')
  //                                             ? Get.find<AdsController>()
  //                                                 .adsData!
  //                                                 .data![index]
  //                                                 .imageUrl
  //                                                 .toString()
  //                                             : 'https://newagahi.ir${Get.find<AdsController>().adsData!.data![index].imageUrl.toString()}',
  //                                       ),
  //                                       fit: BoxFit.cover,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   )),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget phone() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.all(4),
          // height: Get.height * 2 / 6 / 5,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'جستجو در همه آگهی ها',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const SelectStatePage(),
                      binding: MyBinding(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Obx(
                      //   () => Text(
                      //     Get.find<CityController>().cityName.value == ''
                      //         ? 'شهر'
                      //         : Get.find<CityController>().cityName.value,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, Get.height / 6 * 3 / 4),
          child: Container(
            height: Get.height / 6 * 3 / 4,
            color: Colors.grey[50],
            child: Obx(() {
              return Get.find<CategoryController>().isDataLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        size: 25,
                        color: Color(0xffC42127),
                        duration: Duration(
                          seconds: 1,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: Get.find<CategoryController>()
                          .categoriesData!
                          .data!
                          .length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(const SubCategory(),
                                binding: MyBinding(),
                                arguments: [
                                  Get.find<CategoryController>()
                                      .categoriesData!
                                      .data![index]
                                      .id,
                                  Get.find<CategoryController>()
                                      .categoriesData!
                                      .data![index]
                                      .name
                                ]);
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Get.width / 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.5),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 23,
                                          child: FaIcon(
                                            // FontAwesomeIcons.graduationCap,
                                            getIcon(
                                              Get.find<CategoryController>()
                                                  .categoriesData!
                                                  .data![index]
                                                  .icon
                                                  .toString(),
                                            ),

                                            color: const Color(0xff595A5C),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Get.find<CategoryController>()
                                            .categoriesData!
                                            .data![index]
                                            .name
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    );
            }),
          ),
        ),
      ),
      body: Center(
        child: Obx(
          () => Get.find<AdsController>().isDataLoading.value
              ? const SpinKitThreeBounce(
                  size: 25,
                  color: Color(0xffC42127),
                  duration: Duration(
                    seconds: 1,
                  ),
                )
              : ListView.separated(
                  cacheExtent: 200,
                  itemCount: Get.find<AdsController>().adsData!.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          const AdsDetails(),
                          binding: MyBinding(),
                          arguments: Get.find<AdsController>()
                              .adsData!
                              .data![index]
                              .id,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        height: Get.height / 5,
                        width: Get.width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Get.find<AdsController>()
                                        .adsData!
                                        .data![index]
                                        .titleLimit
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    Get.find<AdsController>()
                                        .adsData!
                                        .data![index]
                                        .descriptionLimit
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      // fontSize: 15,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    Get.find<AdsController>()
                                                .adsData!
                                                .data![index]
                                                .price ==
                                            0
                                        ? 'توافقی'
                                        : '${formatter.format(Get.find<AdsController>().adsData!.data![index].price)} تومان',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Get.find<AdsController>().adsData!.data![index].updatedAt} در ${Get.find<AdsController>().adsData!.data![index].state}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                width: Get.width / 3,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      Get.find<AdsController>()
                                              .adsData!
                                              .data![index]
                                              .imageUrl
                                              .toString()
                                              .startsWith('https://newagahi.ir')
                                          ? Get.find<AdsController>()
                                              .adsData!
                                              .data![index]
                                              .imageUrl
                                              .toString()
                                          : 'https://newagahi.ir${Get.find<AdsController>().adsData!.data![index].imageUrl.toString()}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      height: 0,
                      indent: 8,
                      endIndent: 8,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
