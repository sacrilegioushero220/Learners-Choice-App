import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/onboarding_screen.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
      routes: [
        GoRoute(
          name: "NameScreen",
          path: "NameScreen",
          builder: (context, state) => const NameScreen(),
        ),
        GoRoute(
          name: "ImageScreen",
          path: "ImageScreen",
          builder: (context, state) => const ImageScreen(),
        )
      ],
    ),
    GoRoute(
      name: "HomeScreen",
      path: "/home",
      builder: (context, state) => const Home(),
    )
  ],
);
