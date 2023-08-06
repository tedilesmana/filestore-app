import 'package:filestore/core/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 15;
}

/// Dialog pop up tanpa avatar/image
class CustomDialogBox extends StatefulWidget {
  /// [title] **variable** untuk memberikan *judul* `dialog`
  /// [descriptions] **variable** untuk memberikan *deskripsi* `dialog`
  /// [text] **variable** untuk menamai button *teks* `dialog`
  final String title, descriptions, text;

  /// [title] **variable** untuk memberikan *judul* `dialog`
  /// [descriptions] **variable** untuk memberikan *deskripsi* `dialog`
  /// [text] **variable** untuk menamai button *teks* `dialog`
  ///
  /// ```
  /// CustomDialogBox(
  ///   descriptions: 'description',
  ///   title: 'Info',
  ///   text: 'OK',
  ///  )
  /// ```
  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
                left: Constants.padding,
                top: Constants.padding,
                right: Constants.padding,
                bottom: Constants.padding),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  widget.descriptions,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 22,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RoundedButton(
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    text: widget.text,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
