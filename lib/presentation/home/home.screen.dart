import 'package:filestore/core/config/color.dart';
import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/controller/xcontroller.dart';
import 'package:filestore/core/data/storage/auth_user.dart';
import 'package:filestore/core/provider/hive.dart';
import 'package:filestore/domain/models/user/user.model.dart';
import 'package:filestore/presentation/list_image/controllers/list_image.controller.dart';
import 'package:filestore/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:filestore/theme.dart';
import 'package:logger/logger.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final themeMode = 0.obs;
  final langName = "en".obs;
  final XController x = XController.to;

  HomeScreen({Key? key}) : super(key: key) {
    themeMode.value = Get.isDarkMode ? 0 : 1;
    langName.value = x.getLangName();
    x.setThemeSystem();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () => onBackPress(),
      child: createBuild(),
    );
  }

  Widget createBuild() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Obx(() => createBody(x, langName.value, themeMode.value)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final callback = await Get.to(
                PostImageScreen(),
                transition: Transition.fadeIn,
              );
              Logger().e(callback);
            },
            child: const Icon(FontAwesome.plus),
          ),
        ),
      ),
    );
  }

  Widget createBody(
      final XController x, final String langName, final int themeMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spaceHeight10,
        rowTopHeader(x, langName),
        spaceHeight10,
        searchTopHeader(),
        spaceHeight20,
        ListImageScreen(),
      ],
    );
  }

  Widget searchTopHeader() {
    ListImageController listImageController = Get.put(ListImageController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 6.0)
                  ],
                  color: Get.theme.cardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Align(
                  alignment: Alignment(1, 0),
                  child: Icon(FontAwesome.search, size: 16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(left: 20.0),
                  ),
                  onChanged: (value) {
                    listImageController.keyword.value = value;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget rowTopHeader(final XController x, final String getLang) {
    final authUserStorage = AuthUserStorage.getAuthUser();
    final auth = UserModel.fromJson(authUserStorage);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Container(
        color: filestore,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment(0, -0.5),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/icons/logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.to(
                    SettingsScreen(
                      themeCallback: () {
                        themeMode.value = Get.isDarkMode ? 0 : 1;
                      },
                      langCallback: () {
                        langName.value = x.getLangName();
                        x.setDefaultLocale();
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary.withOpacity(1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      auth.user!.name!.capitalizeFirst!,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _channel = const MethodChannel('com.binarasia.filestore/app_retain');
  Future<bool> onBackPress() {
    debugPrint("onBackPress HomeScreen...");
    if (GetPlatform.isAndroid) {
      if (Navigator.of(Get.context!).canPop()) {
        return Future.value(true);
      } else {
        _channel.invokeMethod('sendToBackground');

        //close and backup hive box
        try {
          Future.microtask(() async {
            HiveBoxProvider().backupHiveBox(MyTheme.hiveBoxName);
          });
        } catch (e) {
          debugPrint("");
        }
        return Future.value(false);
      }
    } else {
      return Future.value(true);
    }
  }
}
