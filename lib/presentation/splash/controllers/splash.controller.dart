import 'dart:async';

import 'package:filestore/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5), () => Get.toNamed(Routes.HOME));
  }
}
