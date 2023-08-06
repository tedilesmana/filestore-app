import 'package:cached_network_image/cached_network_image.dart';
import 'package:filestore/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoOval extends StatelessWidget {
  final String url;
  final double size;
  const PhotoOval({Key? key, required this.url, this.size = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(size),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) => Loading.type2(),
        ),
      ),
    );
  }
}
