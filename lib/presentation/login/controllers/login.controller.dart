import 'package:filestore/core/data/storage/auth_user.dart';
import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:filestore/domain/repository/auth/auth.repository.dart';
import 'package:filestore/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formPostLoginKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var email = '';
  var password = '';

  final loadingPostImage = false.obs;
  final passwordVisible = true.obs;

  Future<void> login() async {
    final isValid = formPostLoginKey.currentState!.validate();
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      if (!isValid) {
        return SnackbarUtil.showInfo(
            message: 'Pastikan kembali data yang kamu masukkan sudah benar !!');
      } else {
        formPostLoginKey.currentState!.save();
        loadingPostImage.value = true;

        dio.FormData formData = dio.FormData.fromMap({
          'email': email,
          'password': password,
        }); 

        try {
          AuthRepository().loginRepository(formData).then((response) {
            if (response.success) {
              AuthUserStorage.setAuthUser(response.data);
              Get.offAllNamed(Routes.HOME);
            } else {
              SnackbarUtil.showInfo(message: response.message);
              loadingPostImage.value = false;
            }
          }).catchError((error) {
            Logger().w(error);
            loadingPostImage.value = false;
          });
        } catch (e) {
          Logger().w(e);
          loadingPostImage.value = false;
          return SnackbarUtil.showInfo(
              message: "Login gagal silahkan coba kembali");
        }
      }
    } catch (error) {
      loadingPostImage.value = false;
      Logger().w(error.toString);
    } finally {
      loadingPostImage.value = false;
      await EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
