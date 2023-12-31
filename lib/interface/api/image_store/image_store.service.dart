import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class ImageStoreService extends GetxService {
  ServiceApi serviceApi = ServiceApi();

  Future<dynamic> getAll(int page, String search, String category_id) async {
    final response = await serviceApi
        .getService(url: '/image-store', data: <String, dynamic>{
      "limit": 10,
      "page": page,
      "search": search,
      "filter": "category_id=$category_id"
    });
    return response;
  }

  Future<dynamic> getId(id) async {
    final response = await serviceApi
        .getService(url: '/image-store/$id', data: <String, dynamic>{});
    return response;
  }

  Future<dynamic> findByKeyword(keyword) async {
    final response = await serviceApi.getService(
        url: '/image-store?search=$keyword', data: <String, dynamic>{});
    return response;
  }

  Future<dynamic> add(data) async {
    final response =
        await serviceApi.postService(url: '/image-store', data: data);
    return response;
  }

  Future<dynamic> edit(data, id) async {
    final response =
        await serviceApi.updateService(url: '/image-store/$id', data: data);
    return response;
  }

  Future<dynamic> getTotalByCategory() async {
    final response = await serviceApi.getService(
        url: '/image-store/total-bycategory', data: <String, dynamic>{});
    return response;
  }
}
