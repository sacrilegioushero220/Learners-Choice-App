import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';
import 'package:learners_choice_app/features/Intro/presentation/name_screen.dart';
import 'package:learners_choice_app/features/Intro/presentation/onboarding_screen.dart';
import 'package:learners_choice_app/features/home/presentation/info_screen.dart';
import 'package:learners_choice_app/features/learners_test/presentation/mock_test_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: CustomTextTheme.customDarkTextTheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: da rkColorScheme),
      home: const Scaffold(
        body: NameScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
