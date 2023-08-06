import 'dart:convert';
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:filestore/theme.dart';
import 'package:uuid/uuid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

enum AppState { loading, done }

class ItemResponse {
  ItemResponse({this.appState = AppState.loading});
  dynamic result;
  String? title;
  List<dynamic>? datas;
  AppState appState = AppState.loading;
}

class ItemCategories {
  ItemCategories({this.appState = AppState.loading});
  AppState appState = AppState.loading;
}

class ItemPost {
  ItemPost({this.appState = AppState.loading});
  dynamic result;
  String? title;
  String? id;
  String? idUser;
  String pagingLimit = MyTheme.pageLimit;
  AppState appState = AppState.loading;
}

class SinglePost {
  SinglePost({this.appState = AppState.loading});
  dynamic result;
  String pagingLimit = MyTheme.pageLimit;
  AppState appState = AppState.loading;
  List<String>? urls;
}

class XController extends GetxController {
  static XController get to => Get.find<XController>();

  static const String aPPNAME = MyTheme.appName;
  static const String aPPVERSION = MyTheme.appVersion;

  Box? _box = Get.find<Box>();
  Box get box => _box!;

  setBox(final Box box) {
    _box = box;
  }

  final thisUuid = "".obs;

  @override
  void onInit() {
    super.onInit();
    String uuid = box.get(MyTheme.prefUuid) ?? const Uuid().v1();
    box.put(MyTheme.prefUuid, uuid);
    thisUuid.value = uuid;

    debugPrint("thisUuid: $thisUuid");
    getAllLocalVariabels();
  }

  final install = <String, dynamic>{}.obs;
  final isProcessAsycnToken = false.obs;
  asyncUuidToken() async {
    debugPrint("asyncUuidToken is running.. ");
    if (isProcessAsycnToken.value) return;

    isProcessAsycnToken.value = true;
    Future.delayed(const Duration(milliseconds: 0), () {
      isProcessAsycnToken.value = false;
    });

    try {
      String? getInstall = box.get(MyTheme.prefInstall) ?? "";
      if (getInstall != null && getInstall != '') {
        install.value = jsonDecode(getInstall);
      }

      debugPrint(install.toString());
    } catch (e) {
      debugPrint("Error asyncUuidToken $e");
    }
  }

  setDefaultLocale() {
    String lang = getLangName();
    String locale = lang == 'id' ? 'id_ID' : 'en_US';
    initializeDateFormatting(locale, null);
    Intl.defaultLocale = locale;
  }

  static Widget photoView(photoUrl) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Get.theme.brightness,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Get.theme.colorScheme.background,
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.topLeft,
        child: PhotoView(
          loadingBuilder: (context, event) => const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          imageProvider: CachedNetworkImageProvider(
            '$photoUrl',
          ),
        ),
      ),
    );
  }

  static makeStatusBarTransparent(final bool isForce) {
    Color statusColor =
        Get.isDarkMode ? const Color(0xff1c252a) : const Color(0xfff7f7f7);
    if (isForce) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: statusColor,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: statusColor,
        systemNavigationBarColor: statusColor,
      ));
    }
  }

  String basename(String path) {
    return path.split('/').last;
  }

  final pagingLimit = MyTheme.pageLimit.obs;
  clearLimitPage() {
    pagingLimit.value = MyTheme.pageLimit;
    update();
  }

  bool getIsDarkMode() {
    bool isDarkMode = box.get(MyTheme.prefDarkName) ?? false;
    box.put(MyTheme.prefDarkName, isDarkMode);

    return isDarkMode;
  }

  bool isThemeProcess = false;
  setThemeSystem() {
    if (isThemeProcess) return;
    isThemeProcess = true;
    Future.delayed(const Duration(seconds: 5), () {
      isThemeProcess = false;
    });

    Color statusColor =
        Get.isDarkMode ? const Color(0xff1c252a) : const Color(0xfff7f7f7);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: statusColor,
      statusBarColor: statusColor,
      // Android Only
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.light : Brightness.dark,

      //iOS only
      statusBarBrightness: Get.isDarkMode ? Brightness.dark : Brightness.light,
    ));
  }

  String getLangName() {
    String langName = box.get(MyTheme.prefLangName) ?? "en";
    box.put(MyTheme.prefLangName, langName);

    return langName;
  }

  getAllLocalVariabels() {}

  bool isProcessGetHome = false;
  fetchHome() async {
    debugPrint("fetchHome isRunning...");
    asyncUuidToken();

    // get home variables
    if (isProcessGetHome) return;
    isProcessGetHome = true;

    Future.delayed(const Duration(milliseconds: 6200), () {
      isProcessGetHome = false;
    });

    try {
      getAllLocalVariabels();
    } catch (e) {
      debugPrint("");
    }
  }
}
