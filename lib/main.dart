import 'dart:async';

import 'package:filestore/core/controller/xcontroller.dart';
import 'package:filestore/core/provider/hive.dart';
import 'package:filestore/core/translate/message_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:filestore/infrastructure/navigation/navigation.dart';
import 'package:filestore/infrastructure/navigation/routes.dart';
import 'package:filestore/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await HiveBoxProvider.initHive();
  HiveBoxProvider boxProvider = HiveBoxProvider();
  final Box box = await boxProvider.openBox(MyTheme.hiveBoxName);

  Get.lazyPut<Box>(() => box);
  Get.lazyPut<XController>(() => XController());

  XController x = XController.to;
  x.setBox(box);
  x.getIsDarkMode();
  x.getLangName();
  x.asyncUuidToken();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: MyTheme.accent,
    ));

    Timer.periodic(const Duration(minutes: 12), (timer) {
      x.asyncUuidToken();
      x.fetchHome();
    });

    return runApp(const MyApp());
  });
}

String? fontFamily = GoogleFonts.mulish().fontFamily;

final themeLight = ThemeData(
  brightness: Brightness.light,
  cardColor: Colors.white,
  fontFamily: fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MyTheme.accent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  ).copyWith(secondary: MyTheme.accent).copyWith(background: MyTheme.grey),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: fontFamily,
  cardColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  ).copyWith(secondary: Colors.deepOrange),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    XController x = XController.to;
    bool isDarkMode = x.getIsDarkMode();
    ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    String lang = x.getLangName().toLowerCase();
    Locale locale =
        lang == 'id' ? const Locale('id', 'ID') : const Locale('en', 'US');

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    Color statusColor =
        isDarkMode ? const Color(0xff1c252a) : const Color(0xfff7f7f7);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: statusColor,
      statusBarColor: statusColor,
      // Android Only
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,

      //iOS only
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    ));

    return HiveLifecycleManager(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: EnvironmentsBadge(
          child: GetMaterialApp(
            initialRoute: Routes.SPLASH,
            debugShowCheckedModeBanner: false,
            getPages: Nav.routes,
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: themeMode,
            supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
            locale: locale,
            translations: MessagesTranslation(),
            builder: EasyLoading.init(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        ),
      ),
    );
  }
}
