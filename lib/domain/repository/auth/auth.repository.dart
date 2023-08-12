import 'package:filestore/domain/models/global_response/global_response.model.dart';
import 'package:filestore/domain/repository/filter_repository.dart';
import 'package:filestore/interface/api/auth/auth.service.dart';

class AuthRepository {
  final AuthService api = AuthService();
  late GlobalResponse response;

  Future<GlobalResponse> loginRepository(data) async {
    var result = await api.login(data);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> registerRepository(data) async {
    var result = await api.register(data);
    return FilterRepository().foldResponse(result);
  }
}
