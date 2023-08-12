import 'package:filestore/core/helper/snackbar.util.dart';
import 'package:filestore/domain/repository/auth/auth.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formPostCommentKey = GlobalKey<FormState>();
  late TextEditingController commentController;
  var comment = '';

  final loadingPostImage = false.obs;

  Future<void> postComment() async {
    final isValid = formPostCommentKey.currentState!.validate();
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      if (!isValid) {
        return SnackbarUtil.showInfo(
            message: 'Pastikan kembali data yang kamu masukkan sudah benar !!');
      } else {
        formPostCommentKey.currentState!.save();
        loadingPostImage.value = true;

        dio.FormData formData = dio.FormData.fromMap({
          'comment': comment,
        });

        try {
          AuthRepository().loginRepository(formData).then((response) {
            if (response.success) {
              Get.back();
              SnackbarUtil.showInfo(message: "Comment berhasil di kirim");
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
          return SnackbarUtil.showInfo(message: "Comment gagal di kirim");
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
    commentController = TextEditingController();
    super.onInit();
  }
}
