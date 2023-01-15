import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Color primaryColor = const Color(0xffC42127);
getIcon(String icon) {
  if (icon == "fa fa-home") {
    return FontAwesomeIcons.house;
  } else if (icon == "fa fa-barcode") {
    return FontAwesomeIcons.barcode;
  } else if (icon == "fa fa-briefcase") {
    return FontAwesomeIcons.briefcase;
  } else if (icon == "fa fa-truck") {
    return FontAwesomeIcons.truck;
  } else if (icon == "fa fa-globe") {
    return FontAwesomeIcons.globe;
  } else if (icon == "fa fa-graduation-cap") {
    return FontAwesomeIcons.graduationCap;
  } else if (icon == "fa fa-rocket") {
    return FontAwesomeIcons.rocket;
  } else if (icon == "fa fa-users") {
    return FontAwesomeIcons.users;
  } else {
    return FontAwesomeIcons.cartShopping;
  }
}

final formatter = NumberFormat(
  ',###',
);
String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
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
  
  
//Desktop ui
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
