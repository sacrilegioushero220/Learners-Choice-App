import 'dart:io';

import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imagePath,
    this.isCircleAvatar = false,
    this.isFileImage = false,
    this.boxFit = BoxFit.contain,
  }) : super(key: key);

  final bool isCircleAvatar;
  final bool isFileImage;
  final BoxFit? boxFit;
  final double width;
  final double height;
  final String imagePath;

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
          fit: boxFit,
        ),
      ),
    );
  }
}
