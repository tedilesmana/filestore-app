import 'package:filestore/core/data/storage.constants.dart';
import 'package:get_storage/get_storage.dart';

class AuthUserStorage {
  static dynamic getAuthUser() {
    var data = GetStorage().read(StorageConstants.authUser);
    return data;
  }

  static setAuthUser(dynamic value) {
    GetStorage().write(StorageConstants.authUser, value);
  }

  static removeAuthUser() {
    return GetStorage().remove(StorageConstants.authUser);
  }
}
