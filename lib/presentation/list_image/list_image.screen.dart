// ignore_for_file: prefer_const_constructors
import 'package:filestore/presentation/list_image/sections/list_image.section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/list_image.controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: use_key_in_widget_constructors
class ListImageScreen extends GetView<ListImageController> {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const WaterDropHeader(),
      footerBuilder: () => const ClassicFooter(),
      headerTriggerDistance: 80.0,
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: ListImageContent(),
    );
  }
}

class ListImageContent extends GetView<ListImageController> {
  const ListImageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: Get.height - 200,
      width: Get.width,
      child: ListAllImageSection(),
    );
  }
}
