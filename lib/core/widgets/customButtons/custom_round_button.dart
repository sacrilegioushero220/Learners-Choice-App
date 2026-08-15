import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

class BuildCustomRoundedButton extends StatelessWidget {
  const BuildCustomRoundedButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.label});
  final Color color;
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 13),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.overlineDark,
          ),
        ),
      ),
    );
  }
}
