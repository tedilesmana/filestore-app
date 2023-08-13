import 'package:filestore/domain/models/category/category.model.dart';
import 'package:filestore/domain/repository/category/category.repository.dart';
import 'package:filestore/presentation/list_image/controllers/list_image.controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final loadingCategory = true.obs;
  RxList<CategoryModel> listCategory = <CategoryModel>[].obs;

  void getAllCategory() async {
    loadingCategory.value = true;
    try {
      CategoryRepository().getAllRepository(1, "").then((response) {
        List listData = response.data;
        listCategory.value =
            listData.map((e) => CategoryModel.fromJson(e)).toList();
        loadingCategory.value = false;
      }).catchError((e) {
        loadingCategory.value = false;
        Logger().e(e);
      });
    } catch (e) {
      Logger().e(e);
    }
  }
  
  @override
  void onInit() {
    ListImageController controller = Get.put(ListImageController());
    getAllCategory();
    controller.getAllImage(1);
    super.onInit();
  }
}
