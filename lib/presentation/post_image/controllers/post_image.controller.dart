import 'dart:io';

import 'package:filestore/core/widgets/snackbar_util.dart';
import 'package:filestore/domain/models/file_upload/file_upload.model.dart';
import 'package:filestore/domain/models/post_image/post_image.model.dart';
import 'package:filestore/domain/repository/file_handler/file_handler.repository.dart';
import 'package:filestore/domain/repository/image_store/image_store.repository.dart';
import 'package:filestore/presentation/list_image/controllers/list_image.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class PostImageController extends GetxController {
  final GlobalKey<FormState> formPostImageKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  var name = '';
  var description = '';
  final loadingPostImage = false.obs;
  final file = const PostImageModel(file: null).obs;
  final fileResponse = const FileUploadModel().obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  Future<void> uploadFile(File file) async {
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      String fileName = file.path.split('/').last;
      loadingPostImage.value = true;

      dio.FormData formData = dio.FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(file.path, filename: fileName),
        "filename": fileName,
        "directory": "images",
      });

      FileHandlerRepository().addRepository(formData).then((response) {
        if (response.success) {
          var responseIntance = FileUploadModel.fromJson(response.data);
          fileResponse.value = responseIntance;
        } else {
          SnackbarUtil.showInfo(message: "Gagal upload silahkan upload ulang");
          loadingPostImage.value = false;
        }
      }).catchError((error) {
        SnackbarUtil.showInfo(message: "Gagal upload silahkan upload ulang");
        loadingPostImage.value = false;
      });
    } catch (error) {
      SnackbarUtil.showInfo(message: "Gagal upload silahkan upload ulang");
      loadingPostImage.value = false;
    } finally {
      loadingPostImage.value = false;
      await EasyLoading.dismiss();
    }
  }

  Future<void> postImage(filePath) async {
    final isValid = formPostImageKey.currentState!.validate();
    await EasyLoading.show(
      status: 'Loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      if (!isValid) {
        return SnackbarUtil.showInfo(
            message: 'Pastikan kembali data yang kamu masukkan sudah benar !!');
      } else {
        formPostImageKey.currentState!.save();
        loadingPostImage.value = true;

        dio.FormData formData = dio.FormData.fromMap({
          'name': name,
          'category': 'general',
          'description': description,
          'extention': fileResponse.value.extention,
          'size': fileResponse.value.size,
          'directory': fileResponse.value.directory,
          'image_url': fileResponse.value.pathURL,
          'filename': fileResponse.value.fileNameWithExt
        });

        try {
          ImageStoreRepository().addRepository(formData).then((response) {
            if (!response.data.toString().contains("Duplicate entry")) {
              if (response.success) {
                ListImageController listImageController =
                    Get.put(ListImageController());
                listImageController.getAllImage(1);
                Get.back();
                SnackbarUtil.showInfo(message: "File berhasil di upload");
              } else {
                SnackbarUtil.showInfo(message: response.message);
                loadingPostImage.value = false;
              }
            } else {
              return SnackbarUtil.showInfo(
                  message: "Nama yang di masukan sudah terdaftar");
            }
          }).catchError((error) {
            Logger().w(error);
            loadingPostImage.value = false;
          });
        } catch (e) {
          Logger().w(e);
          loadingPostImage.value = false;
        }
      }
    } catch (error) {
      Logger().w(error.toString);
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
