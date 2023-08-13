import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class CategoryService extends GetxService {
  ServiceApi serviceApi = ServiceApi();

  Future<dynamic> getAll(int page, String search) async {
    final response = await serviceApi.getService(
        url: '/category',
        data: <String, dynamic>{"limit": 1000, "page": page, "search": search});
    return response;
  }

  Future<dynamic> getId(id) async {
    final response =
        await serviceApi.getService(url: '/category/$id', data: <String, dynamic>{});
    return response;
  }

  Future<dynamic> findByKeyword(keyword) async {
    final response =
        await serviceApi.getService(url: '/category?search=$keyword', data: <String, dynamic>{});
    return response;
  }

  Future<dynamic> add(data) async {
    final response = await serviceApi.postService(url: '/category', data: data);
    return response;
  }

  Future<dynamic> edit(data, id) async {
    final response =
        await serviceApi.updateService(url: '/category/$id', data: data);
    return response;
  }
}
