import 'package:filestore/interface/api/api.service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  ServiceApi serviceApi = ServiceApi();

  Future<dynamic> register(data) async {
    final response =
        await serviceApi.postService(url: '/auth/register', data: data);
    return response;
  }

  Future<dynamic> login(data) async {
    final response =
        await serviceApi.postService(url: '/auth/login', data: data);
    return response;
  }
}
