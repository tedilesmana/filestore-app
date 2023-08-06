import 'package:filestore/core/controller/xcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filestore/theme.dart';

class ToggleLang extends StatelessWidget {
  final VoidCallback callback;
  const ToggleLang({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final XController x = XController.to;
    final Box hiveBox = x.box;

    return hiveBox.isNotEmpty
        ? ValueListenableBuilder(
            valueListenable: hiveBox.listenable(),
            builder: (context, Box? box, widget) {
              return toggleLang(box?.get(MyTheme.prefLangName) ?? false);
            },
          )
        : toggleLang(hiveBox.get(MyTheme.prefLangName) ?? false);
  }

  Widget toggleLang(final String langName) {
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
          Text(langName == 'en' ? 'EN' : 'ID'),
          Switch(
            value: langName == 'en',
            activeColor: Get.theme.colorScheme.secondary,
            onChanged: (value) async {
              box.put(MyTheme.prefLangName, value ? 'en' : 'id');

              await Future.delayed(const Duration(milliseconds: 300), () async {
                Locale locale =
                    value ? const Locale('en', 'US') : const Locale('id', 'ID');
                Get.updateLocale(locale);
                callback();
              });
            },
          )
        ],
      ),
    );
  }
}
