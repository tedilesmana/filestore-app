import 'package:filestore/presentation/list_image/controllers/list_image.controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    ListImageController controller = Get.put(ListImageController());
    controller.getAllImage(1);
    super.onInit();
  }
}
