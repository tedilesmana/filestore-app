import 'dart:ui';

import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/controller/xcontroller.dart';
import 'package:filestore/core/models/user_model.dart';
import 'package:filestore/core/widgets/photo_oval.dart';
import 'package:filestore/core/widgets/shadow_container.dart';
import 'package:filestore/core/widgets/toggle_lang.dart';
import 'package:filestore/core/widgets/toggle_theme.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';

import 'controllers/settings.controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  final VoidCallback themeCallback;
  final VoidCallback langCallback;

  static final defUser = UserModel().obs;

  SettingsScreen(
      {Key? key, required this.themeCallback, required this.langCallback})
      : super(key: key) {
    final XController x = XController.to;

    //get all post by user
    x.clearLimitPage();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final XController x = XController.to;

    XController.makeStatusBarTransparent(true);
    themeMode.value = Get.isDarkMode ? 0 : 1;
    langName.value = x.getLangName();

    return createBody(x);
  }

  Widget createBody(final XController x) {
    return Container(
      color: Colors.transparent,
      height: Get.height,
      width: Get.width,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              Obx(() => createSliverApp(x, langName.value, themeMode.value)),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Obx(() =>
                        rowBodyColumn(x, langName.value, themeMode.value)),
                    spaceHeight20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createSliverApp(
      final XController x, final String getLang, final int getTheme) {
    return SliverAppBar(
      backgroundColor: Get.theme.cardColor,
      elevation: 0.5,
      leadingWidth: 65,
      leading: iconBack(Feather.chevron_left),
      centerTitle: true,
      title: Container(),
      floating: true,
      pinned: true,
      snap: false,
      stretch: true,
      expandedHeight: Get.height / 1.7,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            stretchModes: const <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: [
                rowTopProfile(x),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget rowTopProfile(final XController x) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondary,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
                tileMode: TileMode.clamp,
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 10,
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.dialog(XController.photoView(
                          "https://hobbies.in-news.id/upload/icon_photography.jpeg"));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Get.theme.cardColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(getProportionateScreenWidth(60)),
                        ),
                      ),
                      child: PhotoOval(
                        size: getProportionateScreenWidth(60),
                        url:
                            "https://hobbies.in-news.id/upload/icon_photography.jpeg",
                      ),
                    ),
                  ),
                  spaceHeight5,
                  Text("FileStore",
                      style: textBold.copyWith(
                          color: Colors.grey[200], fontSize: 14, height: 1.1)),
                  Text("Applikasi",
                      style: textBold.copyWith(
                          color: Colors.white, fontSize: 20, height: 1.1)),
                  spaceHeight5,
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Feather.mail, size: 12, color: Colors.white),
                        spaceWidth10,
                        Text("FileStore",
                            style: textBold.copyWith(
                                color: Colors.grey[100], fontSize: 11)),
                      ],
                    ),
                  ),
                  spaceHeight10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final themeMode = 0.obs;
  final langName = "en".obs;

  Widget rowBodyColumn(
      final XController x, final String getLang, final int mode) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        myProfile(x),
        spaceHeight50,
      ],
    );
  }

  Widget myProfile(final XController x) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShadowContainer(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("language".tr),
                    spaceHeight5,
                    ToggleLang(
                      callback: () {
                        langName.value = x.getLangName();
                        x.setDefaultLocale();

                        Future.microtask(() {
                          langCallback();
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("theme".tr),
                    spaceHeight5,
                    ToggleTheme(
                      callback: () {
                        themeMode.value = Get.isDarkMode ? 0 : 1;
                        Future.microtask(() {
                          XController.makeStatusBarTransparent(false);
                          themeCallback();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        spaceHeight5,
      ],
    );
  }

  Widget iconBack(final IconData icon) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: ClipOval(
              child: Icon(
                icon,
                size: 28,
                color: Get.theme.textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
