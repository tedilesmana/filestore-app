import 'package:filestore/core/controller/xcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filestore/theme.dart';

class ToggleTheme extends StatelessWidget {
  final VoidCallback callback;
  const ToggleTheme({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final XController x = XController.to;
    final Box hiveBox = x.box;

    return hiveBox.isNotEmpty
        ? ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, Box? box, widget) {
              return toggleTheme(box?.get(MyTheme.prefDarkName) ?? false);
            },
          )
        : toggleTheme(hiveBox.get(MyTheme.prefDarkName) ?? false);
  }

  Widget toggleTheme(final bool isDarkMode) {
    final box = XController.to.box;
    return Container(
      width: Get.width / 3.5,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Get.theme.colorScheme.secondary.withOpacity(.2),
            blurRadius: 5.0,
            offset: const Offset(2, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spaceWidth5,
          Image.asset(
            isDarkMode ? 'assets/night.png' : 'assets/day.png',
            width: 22,
            height: 22,
          ),
          Switch(
            value: isDarkMode,
            activeColor: Get.theme.colorScheme.secondary,
            onChanged: (value) async {
              box.put(MyTheme.prefDarkName, value);
              ThemeMode themeModeNew = value ? ThemeMode.dark : ThemeMode.light;
              Get.changeThemeMode(themeModeNew);

              await Future.delayed(const Duration(milliseconds: 800), () async {
                Color statusColor =
                    value ? const Color(0xff1c252a) : const Color(0xfff7f7f7);

                SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle(
                    systemNavigationBarColor: statusColor,
                    statusBarColor: statusColor, //Colors.transparent,
                    statusBarBrightness:
                        value ? Brightness.dark : Brightness.light,
                    statusBarIconBrightness:
                        value ? Brightness.light : Brightness.dark,
                  ),
                );

                callback();
              });
            },
          )
        ],
      ),
    );
  }
}
