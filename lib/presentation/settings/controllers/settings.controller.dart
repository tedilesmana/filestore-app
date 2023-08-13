import 'package:filestore/domain/models/statistics/statistics.model.dart';
import 'package:filestore/domain/repository/image_store/image_store.repository.dart';
import 'package:filestore/presentation/settings/sections/chart.section.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SettingsController extends GetxController {
  final loadingImageStoreByCategory = true.obs;
  RxList<StatisticsModel> listImageStoreByCategory = <StatisticsModel>[].obs;
  RxList<ChartData> data = <ChartData>[].obs;
  final totalData = 0.obs;

  void getAllImageStoreByCategory() async {
    totalData.value = 0;
    loadingImageStoreByCategory.value = true;
    try {
      ImageStoreRepository().getTotalByCategoryRepository().then((response) {
        List listData = response.data;
        List<StatisticsModel> listStatistic =
            listData.map((e) => StatisticsModel.fromJson(e)).toList();
        listImageStoreByCategory.value = listStatistic;

        List<ChartData> itemList = [];
        for (var element in listStatistic) {
          totalData.value = totalData.value + element.total!;
          var item =
              ChartData(element.category!.name!, double.parse(element.total.toString()));
          itemList = [...itemList, item];
        }
        data.assignAll(itemList);
        loadingImageStoreByCategory.value = false;
      }).catchError((e) {
        loadingImageStoreByCategory.value = false;
        Logger().e(e);
      });
    } catch (e) {
      Logger().e(e);
    }
  }
}
