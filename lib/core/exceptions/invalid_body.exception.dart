import 'package:filestore/config.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:logger/logger.dart';

class InvalidBodyException implements Exception {
  final env = ConfigEnvironments.getEnvironments()['env'];
  final String message;
  InvalidBodyException({required this.message}) {
    bool isProduction = env != Environments.PRODUCTION;
    if(isProduction ) Logger().w(message);
    SnackbarUtil.showError(message: message);
  }

  @override
  String toString() => message;
}
