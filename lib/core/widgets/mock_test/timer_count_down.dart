import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  final int timeRemaining;

  const CountDownTimer({super.key, required this.timeRemaining});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 40,
      child: Center(
        child: Text(
          '$timeRemaining seconds',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0.10,
            letterSpacing: 0.10,
          ),
        ),
      ),
    );
  }
}
