import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class ImageStoreService extends GetxService {
  ServiceApi serviceApi = ServiceApi();

  Future<dynamic> getAll(int page, String search) async {
    final response = await serviceApi.getService(
        url: '/image-store', data: <String, dynamic>{"limit": 10, "page": page, "search": search});
    return response;
  }

  Future<dynamic> getId(id) async {
    final response =
        await serviceApi.getService(url: '/image-store/$id', data: {});
    return response;
  }

  Future<dynamic> findByKeyword(keyword) async {
    final response = await serviceApi
        .getService(url: '/image-store?search=$keyword', data: {});
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
}
