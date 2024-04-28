import 'package:flutter/material.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';

import 'Presentation/Intro/onboarding_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: CustomTextTheme.customDarkTextTheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const Scaffold(
        body: NameScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
