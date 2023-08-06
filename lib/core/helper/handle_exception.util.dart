import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:filestore/core/exceptions/cancel.exception.dart';
import 'package:filestore/core/exceptions/connect_time_out.exception.dart';
import 'package:filestore/core/exceptions/default.exception.dart';
import 'package:filestore/core/exceptions/receive_time_out.exception.dart';
import 'package:filestore/core/exceptions/send_time_out.exception.dart';
import 'package:filestore/config.dart';

class HandleException {
  final env = ConfigEnvironments.getEnvironments()['env'];

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return json.encode(error);
      case 401:
        return json.encode(error);
      case 403:
        return json.encode(error);
      case 404:
        return json.encode(error);
      case 408:
        return json.encode(error);
      case 422:
        return json.encode(error);
      case 500:
        return json.encode(error);
      case 503:
        return json.encode(error);
      default:
        return 'Oops something went wrong';
    }
  }

  String handleDioError(dioError) {
    bool isProduction = env != Environments.PRODUCTION;
    String errorMessage = dioError.toString();
    if (dioError.response!.statusCode! == 401) {}
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        ConnectTimeOutException(
            message: isProduction
                ? 'Dio Exception : Connection timeout with API server'
                : 'Connection timeout with API server');
        break;
      case DioErrorType.sendTimeout:
        SendTimeOutException(
            message: isProduction
                ? 'Dio Exception : Send timeout in connection with API server'
                : 'Send timeout in connection with API server');
        break;
      case DioErrorType.receiveTimeout:
        ReceiveTimeOutException(
            message: isProduction
                ? 'Dio Exception : Receive timeout in connection with API server'
                : 'Receive timeout in connection with API server');
        break;
      case DioErrorType.response:
        errorMessage = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.cancel:
        CancelException(
            message: isProduction
                ? 'Dio Exception : Request to API server was cancelled'
                : 'Request to API server was cancelled');
        break;
      case DioErrorType.other:
        DefaultException(
            message: isProduction
                ? 'Dio Exception : Oops something went wrong!, please check your connection'
                : 'Oops something went wrong!, please check your connection');
        break;
    }

    return errorMessage;
  }
}
