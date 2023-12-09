import 'package:flutter/material.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/widgets/info_screen_widgets.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: buildImageWidget(
                    width: 223,
                    height: 49,
                    imagePath: choiceIconPath,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ), //
                buildAboutCard(context),
                const SizedBox(
                  height: 12,
                ),
                buildInfoTileCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
