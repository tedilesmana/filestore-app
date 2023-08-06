import 'package:filestore/config.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
class DefaultException implements Exception {
  final env = ConfigEnvironments.getEnvironments()['env'];
  final String message;
  final StackTrace? stackTrace;
  DefaultException({
    this.message =
        'Oops something went wrong!, please wait our service under maintanance',
    this.stackTrace,
  }) {
    SnackbarUtil.showInfo(message: message);
  }

  @override
  String toString() => message;
}
