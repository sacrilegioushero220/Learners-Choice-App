import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        '20 : 00',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          height: 0.10,
          letterSpacing: 0.10,
        ),
      ),
    );
  }
}
