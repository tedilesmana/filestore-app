import 'package:get/get.dart';

import '../../../../presentation/list_image/controllers/list_image.controller.dart';

class ListImageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListImageController>(
      () => ListImageController(),
    );
  }
}
