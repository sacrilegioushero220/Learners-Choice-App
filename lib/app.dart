import 'package:flutter/material.dart';
import 'package:learners_choice_app/config/app_router.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';
import 'package:learners_choice_app/presentation/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,

      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: CustomTextTheme.customDarkTextTheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: da rkColorScheme),
      // builder: (context, child) => const Scaffold(
      //   body: Home(),
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}
