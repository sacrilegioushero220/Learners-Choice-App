import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/customButtons/custom_fab_button.dart';
import 'package:learners_choice_app/features/Intro/Presentation/UI/name_screen.dart';

//
class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 44.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.person_add,
                    color: context.primary,
                    size: 60.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                    width: 291,
                    child: Text(
                      imageTitle,
                      style: context.displayLargeLight,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  imageSubtitle,
                  style: context.titleSmallLight!.copyWith(
                    color: context.primary,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {},
                  child: buildImageWidget(
                    width: 316,
                    height: 263.39,
                    imagePath: imageAvatar,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 130,
                  width: 328,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCustomFabButton(
                          context: BuildContext,
                          label: "Back",
                          onPressed: () {},
                          isReversed: true,
                          icon: Icons.arrow_back),
                      buildCustomFabButton(
                        context: BuildContext,
                        label: "Next",
                        onPressed: () {},
                        isReversed: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
