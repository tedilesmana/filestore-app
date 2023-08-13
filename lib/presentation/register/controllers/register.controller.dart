import 'package:filestore/core/widgets/snackbar_util.dart';
import 'package:filestore/domain/repository/auth/auth.repository.dart';
import 'package:filestore/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class RegisterController extends GetxController {
  final GlobalKey<FormState> formPostRegisterKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  var name = '';
  var email = '';
  var phoneNumber = '';
  var password = '';

  final loadingPostImage = false.obs;
  final passwordVisible = true.obs;

  Future<void> postComment() async {
    final isValid = formPostRegisterKey.currentState!.validate();
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      if (!isValid) {
        return SnackbarUtil.showInfo(
            message: 'Pastikan kembali data yang kamu masukkan sudah benar !!');
      } else {
        formPostRegisterKey.currentState!.save();
        loadingPostImage.value = true;

        dio.FormData formData = dio.FormData.fromMap({
          'name': name,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
        });

        try {
          AuthRepository().registerRepository(formData).then((response) {
            if (response.success) {
              Get.offNamed(Routes.LOGIN);
              SnackbarUtil.showInfo(message: "Akun berhasil di daftarkan silahkan login");
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
          return SnackbarUtil.showInfo(message: "Akun gagal di daftarkan");
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
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
