import 'package:filestore/core/helper/helper.util.dart';
import 'package:filestore/core/widgets/rounded_button.dart';
import 'package:filestore/core/widgets/text_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var utilHelper = UtilHelper.instance;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Form(
              key: controller.formPostCommentKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextInput(
                      key: const Key("comment"),
                      label: "Komentar",
                      isLabel: false,
                      placeholder: "Masukkan Komentar Gambar",
                      controller: controller.commentController,
                      onSaved: (value) {
                        controller.comment = value!;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        return utilHelper.validateRequire(value!, "Komentar ");
                      },
                      obscureText: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextInput(
                      key: const Key("comment"),
                      label: "Komentar",
                      isLabel: false,
                      placeholder: "Masukkan Komentar Gambar",
                      controller: controller.commentController,
                      onSaved: (value) {
                        controller.comment = value!;
                      },
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        return utilHelper.validateRequire(value!, "Komentar ");
                      },
                      obscureText: false,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: RoundedButton(
                      text: "Komentar",
                      onPress: () => controller.postComment(),
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
