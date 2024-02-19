import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget untuk membuat kolom input
class TextArea extends StatelessWidget {
  /// [label] **variable** untuk menamung *nama* `input`
  final String label;

  /// [placeholder] **variable** untuk menamung *petunjuk* `input`
  final String placeholder;

  /// [controller] **variable** untuk controller *widget* `input`
  final TextEditingController controller;

  /// [onFieldSubmitted] **variabel** untuk mentrigger *Function* `submit pada keyboard`
  final Function? onFieldSubmitted;

  /// [isLabel] **variable** untuk memenuculkan / menghilangkan *label* `input`
  final bool? isLabel;

  /// [onSaved] **variabel** untuk mentrigger *Function* `simpan data input`
  final Function onSaved;

  /// [validator] **variabel** untuk mentrigger *Function* `validasi data input`
  final Function validator;

  /// [obscureText] **variable** untuk memunculkan/menyembunyikan apa yang di input
  final bool obscureText;

  /// [keyboardType] **variable** untuk memilih jenis keyboard *yang di gunakan saat* `input`
  final TextInputType keyboardType;

  /// [label] **variable** untuk menamung *nama* `input`
  /// [placeholder] **variable** untuk menamung *petunjuk* `input`
  /// [controller] **variable** untuk controller *widget* `input`
  /// [isLabel] **variable** untuk memenuculkan / menghilangkan *label* `input`
  /// [onFieldSubmitted] **variabel** untuk mentrigger *Function* `submit pada keyboard`
  /// [onSaved] **variabel** untuk mentrigger *Function* `simpan data input`
  /// [validator] **variabel** untuk mentrigger *Function* `validasi data input`
  /// [obscureText] **variable** untuk memunculkan/menyembunyikan apa yang di input
  /// [keyboardType] **variable** untuk memilih jenis keyboard *yang di gunakan saat* `input`
  ///
  /// ```
  ///       TextArea(
  ///          label: "Password",
  ///          placeholder: 'Input password di sini',
  ///          controller: controller.passwordController,
  ///          onSaved: (value) {
  ///            controller.password = value!;
  ///          },
  ///          validator: (value) {
  ///            return controller.validatePassword(value!);
  ///          },
  ///          obscureText: true,
  ///          keyboardType: TextInputType.visiblePassword,
  ///          onFieldSubmitted: (_) {
  ///            controller.doLogin();
  ///          },
  ///        )
  /// ```
  ///

  const TextArea({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.isLabel = true,
    this.onFieldSubmitted,
    required this.onSaved,
    required this.validator,
    required this.obscureText,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLabel!
            ? Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      color: Get.theme.cardColor,
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.edit,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '$label : ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Container(),
        Stack(
          children: [
            Container(
              height: 95,
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
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: keyboardType,
                obscureText: obscureText,
                onFieldSubmitted: (String string) {
                  onFieldSubmitted!(string);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: placeholder,
                  hintStyle: const TextStyle(fontSize: 13),
                  contentPadding: const EdgeInsets.only(left: 20.0),
                ),
                onSaved: (value) => onSaved(value),
                validator: (value) => validator(value),
                minLines: 5,
                maxLines: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
