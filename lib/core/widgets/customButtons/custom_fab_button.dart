import 'package:flutter/material.dart';

class BuildCustomFabButton extends StatelessWidget {
  const BuildCustomFabButton({
    required this.heroTag,
    super.key,
    this.icon = Icons.arrow_forward,
    this.ishidden = false,
    required this.label,
    required this.isReversed,
    required this.onPressed,
  });

  final bool ishidden;
  final String heroTag;
  final String label;
  final bool isReversed;
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      backgroundColor: const Color(0xFFFCF1F3),
      onPressed: onPressed,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isReversed
              ? !ishidden
                  ? Icon(
                      icon,
                      color: const Color(0xFF00639B),
                    )
                  : const SizedBox(width: 2)
              : const SizedBox(width: 2),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF00639B),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.10,
              letterSpacing: 0.10,
            ),
          ),
          isReversed
              ? const SizedBox(width: 8)
              : !ishidden
                  ? const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF00639B),
                    )
                  : const SizedBox(width: 2),
        ],
      ),
      heroTag: heroTag,
    );
  }
}
