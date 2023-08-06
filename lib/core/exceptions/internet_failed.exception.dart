import 'package:filestore/config.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:logger/logger.dart';

class InternetFailedException implements Exception {
  final env = ConfigEnvironments.getEnvironments()['env'];
  final String message;

  InternetFailedException({
    this.message = 'Connection to API server failed due to internet connection!',
  }) {
    bool isProduction = env != Environments.PRODUCTION;
    if(isProduction ) Logger().w(message);
    SnackbarUtil.showError(message: message);
  }

  @override
  String toString() => message;
}
