import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:filestore/config.dart';
import 'package:filestore/core/data/storage/auth_user.dart';
import 'package:filestore/core/helper/handle_exception.util.dart';
import 'package:filestore/domain/models/user/user.model.dart';

class ServiceApi {
  final Dio dio = Dio();
  HandleException exceptionService = HandleException();
  final baseUrl = ConfigEnvironments.getEnvironments()['base_url'].toString();

  Future<Either<String, dynamic>> getService(
      {required url, required data}) async {
    final authUserStorage = AuthUserStorage.getAuthUser();
    final token = authUserStorage == null
        ? ""
        : UserModel.fromJson(authUserStorage).auth!.access_token;
    Response response;

    try {
      response = await dio.get(
        '$baseUrl/api$url',
        queryParameters: data,
        options: Options(
          headers: {
            'Accept': Headers.jsonContentType,
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return right(response);
    } on DioError catch (dioError) {
      String errorMessage = exceptionService.handleDioError(dioError);
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> postService(
      {required url, required data}) async {
    final authUserStorage = AuthUserStorage.getAuthUser();
    final token = authUserStorage == null
        ? ""
        : UserModel.fromJson(authUserStorage).auth!.access_token;
    Response response;
    try {
      response = await dio.post(
        '$baseUrl/api$url',
        data: data,
        options: Options(
          headers: {
            'Accept': Headers.jsonContentType,
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return right(response);
    } on DioError catch (dioError) {
      String errorMessage = exceptionService.handleDioError(dioError);
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> updateService(
      {required url, required data}) async {
    final authUserStorage = AuthUserStorage.getAuthUser();
    final token = authUserStorage == null
        ? ""
        : UserModel.fromJson(authUserStorage).auth!.access_token;
    Response response;
    try {
      response = await dio.put(
        '$baseUrl/api$url',
        data: data,
        options: Options(
          headers: {
            'Accept': Headers.jsonContentType,
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return right(response);
    } on DioError catch (dioError) {
      String errorMessage = exceptionService.handleDioError(dioError);
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> deleteService(
      {required url, required data}) async {
    final authUserStorage = AuthUserStorage.getAuthUser();
    final token = authUserStorage == null
        ? ""
        : UserModel.fromJson(authUserStorage).auth!.access_token;
    Response response;
    try {
      response = await dio.delete(
        '$baseUrl/api$url',
        data: data,
        options: Options(
          headers: {
            'Accept': Headers.jsonContentType,
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return right(response);
    } on DioError catch (dioError) {
      String errorMessage = exceptionService.handleDioError(dioError);
      return left(errorMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
