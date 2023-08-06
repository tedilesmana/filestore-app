import 'package:get/get.dart';

import '../../../../presentation/post_image/controllers/post_image.controller.dart';

class PostImageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostImageController>(
      () => PostImageController(),
    );
  }
}
