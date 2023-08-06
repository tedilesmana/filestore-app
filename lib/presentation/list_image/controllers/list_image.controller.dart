import 'package:filestore/domain/models/global_response/global_response.model.dart';
import 'package:filestore/domain/models/image_store/image_store.model.dart';
import 'package:filestore/domain/repository/image_store/image_store.repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ListImageController extends GetxController {
  final currentPage = 1.obs;
  final keyword = "".obs;
  final loadingListImage = true.obs;
  RxList<ImageStoreModel> listImage = <ImageStoreModel>[].obs;

  Future<void> getAllImage(int page) async {
    loadingListImage.value = true;
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    try {
      GlobalResponse response =
          await ImageStoreRepository().getAllRepository(page, keyword.value);
      Logger().w(response);
      if (response.success) {
        currentPage.value = 2;
        List listItem = response.data;
        listImage.value =
            listItem.map((e) => ImageStoreModel.fromJson(e)).toList();
        loadingListImage.value = false;
      } else {
        loadingListImage.value = false;
      }
    } catch (e) {
      Logger().e(e);
      loadingListImage.value = false;
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> getAllImagePagination(int page) async {
    loadingListImage.value = true;
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );
    try {
      GlobalResponse response =
          await ImageStoreRepository().getAllRepository(page, keyword.value);
      if (response.success) {
        List listItem = response.data;
        listImage.value = [
          ...listImage,
          ...listItem.map((e) => ImageStoreModel.fromJson(e)).toList()
        ];
        currentPage.value = currentPage.value + 1;
        loadingListImage.value = false;
      } else {
        loadingListImage.value = false;
      }
    } catch (e) {
      Logger().e(e);
      loadingListImage.value = false;
    } finally {
      await EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    getAllImage(1);
    debounce(
      keyword,
      (_) => getAllImage(1),
      time: const Duration(seconds: 1),
    );
    super.onInit();
  }
}
