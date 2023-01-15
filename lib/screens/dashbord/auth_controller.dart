import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController with CacheManager {
  var isDataLoading = false.obs;
  var isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
    removeTel();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<bool> saveTel(String? tel) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.Tel.toString(), tel);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  String? getTel() {
    final box = GetStorage();
    return box.read(CacheManagerKey.Tel.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeTel() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.Tel.toString());
  }
}

enum CacheManagerKey { TOKEN, Tel }
