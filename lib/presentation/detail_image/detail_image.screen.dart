import 'package:cached_network_image/cached_network_image.dart';
import 'package:filestore/config.dart';
import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/helper/helper.util.dart';
import 'package:filestore/core/widgets/loading.dart';
import 'package:filestore/core/widgets/rounded_button.dart';
import 'package:filestore/core/widgets/text_area.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'controllers/detail_image.controller.dart';

class DetailImageScreen extends GetView<DetailImageController> {
  const DetailImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseUrl = ConfigEnvironments.getEnvironments()['base_url'].toString();
    var utilHelper = UtilHelper.instance;
    controller.getAllComment(controller.detailImage.id);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      Get.back();
                    },
                    icon: const Icon(Feather.chevron_left, size: 28),
                  ),
                  Text(
                    "Detail Image",
                    style: textBold.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  height: Get.height - 30,
                  width: Get.width,
                  child: Container(
                    width: Get.width - 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15, top: 15),
                    decoration: BoxDecoration(
                      color: Get.theme.cardColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Get.theme.colorScheme.secondary.withOpacity(.2),
                          blurRadius: 5.0,
                          offset: const Offset(2, 5),
                        )
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                width: Get.width,
                                height: getProportionateScreenHeight(220),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        Loading.type2(),
                                    imageUrl:
                                        "$baseUrl${controller.detailImage.image_url}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              spaceHeight10,
                              Text("${controller.detailImage.name}",
                                  maxLines: 1,
                                  style: textBold.copyWith(fontSize: 18)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${controller.detailImage.description}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textBold.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              spaceHeight5,
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: RoundedButton(
                                  text: "Komentar",
                                  loading: false,
                                  onPress: () {
                                    return showModalBottomSheet(
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        isScrollControlled: true,
                                        builder: (context) => Padding(
                                              padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom,
                                                top: 20,
                                              ),
                                              child: Form(
                                                key: controller
                                                    .formPostCommentKey,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.0),
                                                      child: Text(
                                                        'Masukan Komentar Kamu',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12),
                                                      child: TextArea(
                                                        key: const Key(
                                                            "comment"),
                                                        label: "Komentar",
                                                        isLabel: false,
                                                        placeholder:
                                                            "Masukkan Komentar Gambar",
                                                        controller: controller
                                                            .commentController,
                                                        onSaved: (value) {
                                                          controller.comment =
                                                              value!;
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        validator: (value) {
                                                          return utilHelper
                                                              .validateRequire(
                                                                  value!,
                                                                  "Komentar ");
                                                        },
                                                        obscureText: false,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 20,
                                                          horizontal: 12),
                                                      child: RoundedButton(
                                                        text: "Komentar",
                                                        onPress: () =>
                                                            controller
                                                                .postComment(),
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Obx(
                                () => Column(
                                  children:
                                      ([...controller.listComment]).map((item) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            item.user != null ? Text("${item.user!.name!.capitalizeFirst} | ") : Container(),
                                            Text(utilHelper
                                                .convertDateTimeFormat(item
                                                    .created_at
                                                    .toString())),
                                          ],
                                        ),
                                        Container(
                                          width: Get.width - 30,
                                          margin: const EdgeInsets.only(
                                              top: 5, bottom: 15),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Text(
                                            item.comment ?? '-',
                                            style: textBold.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
