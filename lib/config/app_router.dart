import 'package:flutter/material.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/onboarding_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/splash_screen.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';

class RouteConfig {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const Home(),
    'onboardingScreen': (context) => const OnboardingScreen(),
    '/nameScreen': (context) => NameScreen(),
    '/imageScreen': (context) => const ImageScreen(),
  };
}
