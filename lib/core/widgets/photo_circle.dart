import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoCircle extends StatelessWidget {
  final String url;
  final double size;
  const PhotoCircle({Key? key, required this.url, this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.7),
              offset: const Offset(0, 2),
            )
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(url),
          ),
        ),
      ),
    );
  }
}
