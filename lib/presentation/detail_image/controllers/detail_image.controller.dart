import 'package:filestore/core/widgets/snackbar_util.dart';
import 'package:filestore/domain/models/comment/comment.model.dart';
import 'package:filestore/domain/models/image_store/image_store.model.dart';
import 'package:filestore/domain/repository/comment/comment.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as dio;

class DetailImageController extends GetxController {
  ImageStoreModel detailImage = Get.arguments;
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
          'image_store_id': detailImage.id,
          'comment': comment,
        });

        try {
          CommentRepository().addRepository(formData).then((response) {
            if (response.success) {
              getAllComment(detailImage.id);
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

  final loadingListComment = true.obs;
  RxList<CommentModel> listComment = <CommentModel>[].obs;

  void getAllComment(image_store_id) {
    loadingListComment.value = true;
    try {
      CommentRepository().getAllRepository(image_store_id).then((response) {
        List listItem = response.data;
        listComment.value =
            listItem.map((e) => CommentModel.fromJson(e)).toList();
        Logger().e(listComment.toJson());
        loadingListComment.value = false;
      }).catchError((e) {
        loadingListComment.value = false;
        Logger().e(e);
      });
    } catch (e) {
      Logger().e(e);
    }
  }

  @override
  void onInit() {
    commentController = TextEditingController();
    super.onInit();
  }
}
