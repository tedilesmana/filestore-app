// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return HOME;
  }

  static const HOME = '/home';
  static const LIST_IMAGE = '/list-image';
  static const POST_IMAGE = '/post-image';
  static const SETTINGS = '/settings';
  static const SPLASH = '/splash';
  static const DETAIL_IMAGE = '/detail-image';
}
