import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class FileHandlerService extends GetxService {
  ServiceApi serviceApi = ServiceApi();
  Future<dynamic> add(data) async {
    final response =
        await serviceApi.postService(url: '/upload/file/local', data: data);
    return response;
  }
}
