import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './bindings/my_binding.dart';
import 'package:get_storage/get_storage.dart';
import './theme/theme.dart';
import './screens/dashbord/dashbord_page.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      initialBinding: MyBinding(),
      theme: themeData,
      home: const DashbordPage(),
    
    );
  }
}
