import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 2, color: Color(0xFF00639B)),
        ),
        hintText: 'Name',
        hintStyle: TextStyle(
          color: context.onSurface,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 0.09,
          letterSpacing: 0.50,
        ),
      ),
    );
  }
}
