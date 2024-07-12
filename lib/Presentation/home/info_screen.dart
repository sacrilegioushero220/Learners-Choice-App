import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/widgets/info_screen_widgets.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              BuildImageWidget(
                width: 500,
                height: 150,
                imagePath: choiceIconPath,
              ),
              //
              buildAboutCard(context),
              const SizedBox(
                height: 30,
              ),
              buildInfoTileCard(context),
            ],
          ),
        ),
      ),
    );
  }
}
