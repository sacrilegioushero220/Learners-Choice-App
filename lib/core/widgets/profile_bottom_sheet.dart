import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/widgets/name_text_field.dart';

Future<dynamic> showProfileDialog(
  BuildContext context,
  TextEditingController controller,
  String profileName,
  String profilePic,
) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(
            controller: controller,
            profileName: profileName,
            profilePic: profilePic,
          ));
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.controller,
      required this.profileName,
      required this.profilePic});
  final TextEditingController controller;
  final String profileName;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const ListTile(
            title: Text("Profile"),
          ),
          Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: NameTextField(
                      controller: controller,
                      hintText: profileName,
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {},
              child: const Text("Update"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
