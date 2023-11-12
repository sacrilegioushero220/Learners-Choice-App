import 'package:flutter/material.dart';

Widget buildCustomFabButton({
  required context,
  required String label,
  required bool isReversed,
  required void Function() onPressed,
  IconData icon = Icons.arrow_forward,
}) {
  return FloatingActionButton.extended(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40))),
    backgroundColor: const Color(0xFFFCF1F3),
    onPressed: onPressed,
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isReversed
            ? Icon(
                icon,
                color: const Color(0xFF00639B),
              )
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
            : const Icon(
                Icons.arrow_forward,
                color: Color(0xFF00639B),
              ),
      ],
    ),
  );
}



//    ? const EdgeInsets.fromLTRB(20, 70, 212, 0)
//           : const EdgeInsets.fromLTRB(212, 70, 20, 0),