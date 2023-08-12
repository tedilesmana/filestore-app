import 'package:filestore/domain/models/global_response/global_response.model.dart';
import 'package:filestore/domain/repository/filter_repository.dart';
import 'package:filestore/interface/api/image_store/image_store.service.dart';

class ImageStoreRepository {
  final ImageStoreService api = ImageStoreService();
  late GlobalResponse response;

  Future<GlobalResponse> getAllRepository(int page, String search) async {
    var result = await api.getAll(page, search);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> getIdRepository(id) async {
    var result = await api.getId(id);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> findByKeywordRepository(keyword) async {
    var result = await api.findByKeyword(keyword);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> editRepository(data, id) async {
    var result = await api.edit(data, id);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> addRepository(data) async {
    var result = await api.add(data);
    return FilterRepository().foldResponse(result);
  }

  Future<GlobalResponse> getTotalByCategoryRepository() async {
    var result = await api.getTotalByCategory();
    return FilterRepository().foldResponse(result);
  }
}
