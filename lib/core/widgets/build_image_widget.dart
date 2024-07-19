import 'package:flutter/material.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    Key? key,
    this.width,
    this.height,
    required this.imagePath,
    this.isCircleAvatar = false,
    this.boxFit = BoxFit.contain,
  }) : super(key: key);

  final bool isCircleAvatar;

  final BoxFit boxFit;
  final double? width;
  final double? height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: isCircleAvatar ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Image.asset(
        imagePath,
        fit: boxFit,
      ),
    );
  }
}
