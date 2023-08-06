import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:filestore/main.dart';

class TopTitle extends StatelessWidget {
  final bool isEnglish;
  const TopTitle({Key? key, this.isEnglish = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fontSize = 24;
    return isEnglish ? topTitleEN(fontSize) : topTitleID(fontSize);
  }

  Widget topTitleEN(final double fontSize) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'FileStore',
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: Get.theme.textTheme.bodyLarge!.color,
            ),
          )
        ],
      ),
    );
  }

  Widget topTitleID(final double fontSize) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'FileStore',
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: Get.theme.textTheme.bodyLarge!.color,
            ),
          )
        ],
      ),
    );
  }
}
