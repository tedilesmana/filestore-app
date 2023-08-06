import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class CommentService extends GetxService {
  ServiceApi serviceApi = ServiceApi();

  Future<dynamic> getAll(image_store_id) async {
    final response = await serviceApi.getService(
        url: '/comment',
        data: <String, dynamic>{
          "limit": 1000,
          "page": 1,
          "filter": "image_store_id=$image_store_id"
        });
    return response;
  }

  Future<dynamic> getId(id) async {
    final response = await serviceApi.getService(url: '/comment/$id', data: {});
    return response;
  }

  Future<dynamic> findByKeyword(keyword) async {
    final response =
        await serviceApi.getService(url: '/comment?search=$keyword', data: {});
    return response;
  }

  Future<dynamic> add(data) async {
    final response = await serviceApi.postService(url: '/comment', data: data);
    return response;
  }

  Future<dynamic> edit(data, id) async {
    final response =
        await serviceApi.updateService(url: '/comment/$id', data: data);
    return response;
  }
}
