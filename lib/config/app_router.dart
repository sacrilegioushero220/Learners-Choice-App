import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/onboarding_screen.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

GoRouter? appRouter;

GoRouter getAppRouter() {
  return appRouter ??= getRoutes();
}

GoRouter getRoutes() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
      routes: [
        GoRoute(
          name: "NameScreen",
          path: "NameScreen",
          // ignore: prefer_const_constructors
          builder: (context, state) => NameScreen(),
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
    ),
  ]);
}

void clearAndNavigate(String path) {
  while (getAppRouter().canPop() == true) {
    getAppRouter().pop();
  }
  getAppRouter().pushReplacement(path);
}

// final GoRouter appRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const OnboardingScreen(),
//       routes: [
//         GoRoute(
//           name: "NameScreen",
//           path: "NameScreen",
//           // ignore: prefer_const_constructors
//           builder: (context, state) => NameScreen(),
//         ),
//         GoRoute(
//           name: "ImageScreen",
//           path: "ImageScreen",
//           builder: (context, state) => const ImageScreen(),
//         )
//       ],
//     ),
//     GoRoute(
//       name: "HomeScreen",
//       path: "/home",
//       builder: (context, state) => const Home(),
//     )
//   ],
// );
