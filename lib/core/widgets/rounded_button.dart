import 'package:filestore/core/animations/touchable_opacity.animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

/// Class Rounded Button digunakan untuk membuat button dengan ujung curve/tidak lancip
class RoundedButton extends StatelessWidget {
  /// [text] **variable** untuk menamung *widget* `icon`
  final String text;

  final Color textColor;

  /// [onPress] di gunakan untuk menjalankan sebuah `function`
  final Function onPress;

  /// [color] **variable** untuk menamung *widget* `color`
  final Color color;

  final bool loading;

  /// [text] **variable** untuk menamung *widget* `icon`
  /// [onPress] di gunakan untuk menjalankan sebuah `function`
  /// [color] **variable** untuk menamung *widget* `color`
  ///
  /// ```
  ///RoundedButton(
  ///  text: 'LOGIN',
  ///  onPress: () {
  /// controller.doLogin();
  ///   },
  /// color: info,
  /// )
  /// ```
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPress,
    required this.color,
    this.loading = false,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!loading) ...[
          TouchableOpacity(
            onTap: () => onPress(),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 6.0)
                ],
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ] else ...[
          Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              size: 26,
              color: Colors.blue,
            ),
          ),
        ]
      ],
    );
  }
}
