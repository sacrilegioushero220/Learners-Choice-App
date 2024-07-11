import 'package:flutter/material.dart';

class ActsCard extends StatelessWidget {
  const ActsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 17,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEBE0E2)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
