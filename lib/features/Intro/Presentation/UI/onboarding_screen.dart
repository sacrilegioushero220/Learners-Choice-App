import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/customButtons/leraners_choice_app_custom_buttons.dart';
import 'package:learners_choice_app/core/widgets/lava/lava_clock.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LavaAnimation(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  introTitle,
                  style: context.displayLargeDark,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  introSubtitle,
                  style: context.displayMediumDark,
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: context.inversePrimary,
                      ),
                      dense: true,
                      title: Text(
                        bodyTitle1,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: context.inversePrimary,
                      ),
                      dense: true,
                      title: Text(
                        bodyTitle2,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.check_circle,
                        color: context.inversePrimary,
                      ),
                      dense: true,
                      title: Text(
                        bodyTitle3,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                      '*This app still in beta, expect the unexpected behavior and UI changes',
                      style: context.subtitle2Dark),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
          child: CustomBigButton(
            onPressed: () {
              // getIt
              //     .get<Box<dynamic>>(instanceName: BoxType.settings.name)
              //     .put(userIntroKey, true);
            },
            title: "Get started",
          ),
        ),
      ),
    );
  }
}
