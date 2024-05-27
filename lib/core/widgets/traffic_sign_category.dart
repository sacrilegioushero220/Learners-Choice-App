import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

class TrafficSignCategoryCard extends StatelessWidget {
  const TrafficSignCategoryCard({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });
  final String iconPath;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFF6EBEE),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: context.captionLight,
            ),
          ],
        ),
      ),
    );
  }
}
