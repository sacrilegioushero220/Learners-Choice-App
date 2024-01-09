import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/onboarding_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/splash_screen.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';

import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

class AppRouter {
  final ProfileBloc profileBloc;
  final GoRouter appRouter;

  AppRouter({required this.profileBloc})
      : appRouter = GoRouter(
          debugLogDiagnostics: true,
          //TODO: turn off for production code
          initialLocation: '/',

          redirect: (context, state) {
            final onboardState = profileBloc;

            if (onboardState is ProfileOnboardedState) {
              return "/home";
            }
            return "/OnboardingScreen";
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const SplashScreen(),
              routes: [
                GoRoute(
                  name: "OnboardingScreen",
                  path: "OnboardingScreen",
                  // ignore: prefer_const_constructors
                  builder: (context, state) => OnboardingScreen(),
                ),
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
            )
          ],
        );
}
