import 'package:cool_alert/cool_alert.dart';
import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/controller/xcontroller.dart';
import 'package:filestore/core/helper/helper.util.dart';
import 'package:filestore/core/widgets/shadow_container.dart';
import 'package:filestore/core/widgets/text_area.dart';
import 'package:filestore/core/widgets/text_input.dart';
import 'package:filestore/core/widgets/upload_image.dart';
import 'package:filestore/presentation/post_image/controllers/post_image.controller.dart';
import 'package:filestore/presentation/post_image/sections/category.section.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PostImageScreen extends StatelessWidget {
  final AutoScrollController? controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(Get.context!).padding.bottom),
      axis: Axis.horizontal);

  final loading = false.obs;
  final XController x = XController.to;

  PostImageScreen({super.key});

  Future<bool> onBackPressPost() {
    debugPrint("PostImageScreen onBackPress... ");
    String getBoxImage = x.box.get(MyTheme.image1) ?? "";
    if (getBoxImage != '') {
      CoolAlert.show(
        backgroundColor: Get.theme.colorScheme.background,
        context: Get.context!,
        type: CoolAlertType.warning,
        text: 'Your image not posted yet, are you sure to close this page?',
        showCancelBtn: true,
        cancelBtnText: "Cancel",
        confirmBtnText: "Yes",
        onConfirmBtnTap: () async {
          Get.back();
          EasyLoading.show(status: 'Loading...');
          debugPrint(getBoxImage);
          await Future.delayed(const Duration(milliseconds: 1800));
          EasyLoading.dismiss();
          x.box.put(MyTheme.image1, "");
          Get.back();
        },
      );

      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  final scrollDirection = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PostImageController postImageController = Get.put(PostImageController());
    var utilHelper = UtilHelper.instance;

    return WillPopScope(
      onWillPop: () => onBackPressPost(),
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Obx(
            () => Scaffold(
              body: postImageController.selectCategory.value
                  ? const CategorySection()
                  : Form(
                      key: postImageController.formPostImageKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.mediaQuery.padding.top),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final callback = await onBackPressPost();
                                    if (callback) {
                                      Get.back();
                                    }
                                  },
                                  icon: const Icon(Feather.chevron_left,
                                      size: 28),
                                ),
                                Text(
                                  "Post Image",
                                  style: textBold.copyWith(fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    postImageController.postImage("");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Get.theme.colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text("Post",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ShadowContainer(
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      child: UploadImage(
                                        title: MyTheme.image1,
                                        width: Get.width / 1.1,
                                        height: Get.height / 3.7,
                                      ),
                                    ),
                                  ),
                                  spaceHeight20,
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'Kategori : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextInput(
                                      key: Key(postImageController
                                          .category_name.value),
                                      initialValue: postImageController
                                          .category_name.value,
                                      onTap: () {
                                        postImageController
                                            .selectCategory.value = true;
                                      },
                                      suffixIcon: const Icon(
                                          Feather.chevron_right,
                                          size: 28),
                                      readOnly: true,
                                      label: "Kategori",
                                      isLabel: false,
                                      placeholder: "Pilih Kategori",
                                      controller: postImageController
                                          .categoryController,
                                      onSaved: (value) {
                                        postImageController.category = value!;
                                      },
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        return utilHelper.validateRequire(
                                            value!, "Kategori ");
                                      },
                                      obscureText: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'Nama : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 0,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Get
                                                .theme.colorScheme.background,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextInput(
                                              key: const Key("name"),
                                              label: "Nama Belakang",
                                              isLabel: false,
                                              placeholder:
                                                  "Masukkan Nama Belakang",
                                              controller: postImageController
                                                  .nameController,
                                              onSaved: (value) {
                                                postImageController.name =
                                                    value!;
                                              },
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                return utilHelper
                                                    .validateRequire(
                                                        value!, "Nama ");
                                              },
                                              obscureText: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceHeight20,
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      'Deskripsi : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 0,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Get
                                                .theme.colorScheme.background,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextArea(
                                              key: const Key("description"),
                                              label: "Deskripsi",
                                              isLabel: false,
                                              placeholder:
                                                  "Masukkan Deskripsi Gambar",
                                              controller: postImageController
                                                  .descriptionController,
                                              onSaved: (value) {
                                                postImageController
                                                    .description = value!;
                                              },
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: (value) {
                                                return utilHelper
                                                    .validateRequire(
                                                        value!, "Deskripsi ");
                                              },
                                              obscureText: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  confirmYourPost(final dynamic dataJson, final String category) {
    CoolAlert.show(
      backgroundColor: Get.theme.colorScheme.background,
      context: Get.context!,
      type: CoolAlertType.warning,
      title: 'confirmation'.tr,
      text: "${'confirm_post'.tr} #$category",
      showCancelBtn: true,
      cancelBtnText: "cancel".tr,
      confirmBtnText: "yes".tr,
      onConfirmBtnTap: () async {
        Get.back();
        Future.microtask(() {
          pushPost(dataJson);
        });
      },
    );
  }

  pushPost(final dynamic encodeData) async {
    EasyLoading.show(status: 'Loading...');

    Future.delayed(const Duration(milliseconds: 6500), () {
      EasyLoading.dismiss();
    });
  }

  final selected = 0.obs;
}
