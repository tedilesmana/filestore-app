import 'package:filestore/core/config/color.dart';
import 'package:filestore/core/helper/helper.util.dart';
import 'package:filestore/core/widgets/rounded_button.dart';
import 'package:filestore/core/widgets/text_input.dart';
import 'package:filestore/infrastructure/navigation/routes.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var utilHelper = UtilHelper.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: controller.formPostRegisterKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      color: filestore,
                      padding: const EdgeInsets.all(15),
                      child: const Align(
                        alignment: Alignment(0, -0.5),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              AssetImage('assets/images/icons/logo.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textBold.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            key: const Key("register-name"),
                            label: "Name",
                            isLabel: false,
                            placeholder: "Masukkan nama",
                            controller: controller.nameController,
                            onSaved: (value) {
                              controller.name = value!;
                            },
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return utilHelper.validateRequire(value!, "Name ");
                            },
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            key: const Key("register-email"),
                            label: "Email",
                            isLabel: false,
                            placeholder: "Masukkan Email",
                            controller: controller.emailController,
                            onSaved: (value) {
                              controller.email = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return utilHelper.validateRequire(value!, "Email ");
                            },
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextInput(
                            key: const Key("register-phoneNumber"),
                            label: "Phone Number",
                            isLabel: false,
                            placeholder: "Masukkan Nomor HP",
                            controller: controller.phoneNumberController,
                            onSaved: (value) {
                              controller.phoneNumber = value!;
                            },
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return utilHelper.validateRequire(
                                  value!, "Phone number ");
                            },
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => TextInput(
                              key: const Key("register-password"),
                              label: "Password",
                              isLabel: false,
                              placeholder: "Masukkan Password",
                              controller: controller.passwordController,
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                return utilHelper.validateRequire(
                                    value!, "Password ");
                              },
                              obscureText: controller.passwordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  controller.passwordVisible.value =
                                      !controller.passwordVisible.value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      child: RoundedButton(
                        text: "Register",
                        onPress: () => controller.postComment(),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Center(
                      child: Text(
                        "If You Have Account",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textBold.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      child: RoundedButton(
                        text: "Sign In Here",
                        onPress: () => Get.offNamed(Routes.LOGIN),
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
