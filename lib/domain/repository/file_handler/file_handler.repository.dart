import 'package:filestore/domain/models/global_response/global_response.model.dart';
import 'package:filestore/domain/repository/filter_repository.dart';
import 'package:filestore/interface/api/file_handler/file_handler.service.dart';

class FileHandlerRepository {
  final FileHandlerService api = FileHandlerService();
  late GlobalResponse response;

  Future<GlobalResponse> addRepository(data) async {
    var result = await api.add(data);
    return FilterRepository().foldResponse(result);
  }
}
