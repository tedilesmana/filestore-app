import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final bool isSetColor;
  final Duration duration = const Duration(milliseconds: 300);
  final double opacity = 0.0;
  final Color color = Colors.white;

  const TouchableOpacity({
    Key? key,
    required this.child,
    required this.onTap,
    this.isSetColor = false,
  }) : super(key: key);

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onLongPress: () {
        setState(() => isDown = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => isDown = false),
      onTap: () {
        widget.onTap();
      },
      child: AnimatedContainer(
        width: widget.isSetColor ? 60 : null,
        height: widget.isSetColor ? 60 : null,
        decoration: BoxDecoration(
          color: widget.isSetColor
              ? isDown
                  ? widget.color
                  : Colors.blue
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.elliptical(70, 70),
          ),
          boxShadow: [
            BoxShadow(
              color: widget.isSetColor
                  ? const Color.fromRGBO(0, 0, 0, 0.07999999821186066)
                  : isDown
                      ? Colors.white
                      : Colors.transparent,
              offset: const Offset(2, 2),
              blurRadius: 3,
            )
          ],
        ),
        duration: widget.duration,
        child: AnimatedOpacity(
          duration: widget.duration,
          opacity: isDown ? widget.opacity : 1,
          child: widget.child,
        ),
      ),
    );
  }
}
