import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String optionDescription;
  final String optionNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    Key? key,
    required this.optionDescription,
    required this.optionNumber,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (optionDescription.isEmpty) return const SizedBox();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
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
              height: 80,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  optionNumber,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const VerticalDivider(color: Color(0xFFD8C2BC)),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
                child: Text(
                  optionDescription,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
