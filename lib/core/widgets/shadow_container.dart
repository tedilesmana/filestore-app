import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:filestore/theme.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  const ShadowContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MyTheme.accent.withOpacity(.2),
            blurRadius: 20.0,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: child,
    );
  }
}
