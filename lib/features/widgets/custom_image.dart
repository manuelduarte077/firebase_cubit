import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.imageFile,
    this.imageUrl,
    this.boxFit = BoxFit.cover,
  });

  final File? imageFile;
  final String? imageUrl;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        fit: boxFit,
      );
    } else if (imageUrl?.isNotEmpty == true) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        progressIndicatorBuilder: (_, __, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        fit: boxFit,
      );
    }
    return const ColoredBox(color: Colors.grey);
  }
}
