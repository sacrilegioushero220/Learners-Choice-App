import 'dart:io';

import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    Key? key,
    this.width,
    this.height,
    required this.imagePath,
    this.isCircleAvatar = false,
    this.boxFit = BoxFit.contain,
    this.isFileImage = false,
  }) : super(key: key);

  final bool isCircleAvatar;

  final BoxFit boxFit;
  final double? width;
  final double? height;
  final String imagePath;
  final bool isFileImage;

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> imageProvider;

    if (isFileImage) {
      imageProvider = FileImage(File(imagePath));
    } else {
      imageProvider = AssetImage(imagePath);
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: isCircleAvatar ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
