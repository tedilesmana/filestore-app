import 'package:filestore/config.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:logger/logger.dart';

class CancelException implements Exception {
  final env = ConfigEnvironments.getEnvironments()['env'];
  final String message;
  CancelException({
    this.message = 'Request to API server was cancelled',
  }) {
    bool isProduction = env != Environments.PRODUCTION;
    if(isProduction ) Logger().w(message);
    SnackbarUtil.showError(message: message);
  }

  @override
  String toString() => message;
}
