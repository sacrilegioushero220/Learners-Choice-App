import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String optionDescription;
  final String optionNumber;
  final bool isSelected;
  final VoidCallback onTap;
  final double leadingFontSize;
  final double trailingFontSize;
  final int optionLength;

  const OptionCard({
    Key? key,
    required this.optionDescription,
    required this.optionNumber,
    required this.onTap,
    this.isSelected = false,
    this.leadingFontSize = 35,
    this.trailingFontSize = 15,
    required this.optionLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (optionDescription.isEmpty) return const SizedBox();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 72,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ? Colors.green : const Color(0xFFFFF8F6),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD8C2BC)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  optionNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: leadingFontSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: Color(0xFFD8C2BC),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, top: 5, right: 15),
                child: Text(
                  optionDescription,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: trailingFontSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
