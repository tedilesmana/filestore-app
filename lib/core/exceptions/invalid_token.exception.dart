import 'package:filestore/config.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:logger/logger.dart';

class InvalidTokenException implements Exception {
  final env = ConfigEnvironments.getEnvironments()['env'];
  final String message;
  InvalidTokenException({this.message = 'Invalid token!'}) {
    bool isProduction = env != Environments.PRODUCTION;
    if(isProduction ) Logger().w(message);
    SnackbarUtil.showError(message: message);
  }

  @override
  String toString() => message;
}
