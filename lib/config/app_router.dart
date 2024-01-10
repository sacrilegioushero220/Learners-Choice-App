import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/Presentation/Intro/onboarding_screen.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/core/blocs/cubit/login_cubit.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter({required this.loginCubit});

  late final GoRouter appRouter = GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) {
      bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;

      final bool loggingIn = state.matchedLocation == "/OnboardingScreen";
      if (!loggedIn) {
        print("loop1");
        return loggingIn ? null : "/OnboardingScreen";
      }
      // ignore: dead_code
      if (loggingIn) {
        print("loop2");
        return "/home";
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: "OnboardingScreen",
        path: "/onboardingScreen",
        // ignore: prefer_const_constructors
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        name: "NameScreen",
        path: "/nameScreen",
        // ignore: prefer_const_constructors
        builder: (context, state) => NameScreen(),
      ),
      GoRoute(
        name: "ImageScreen",
        path: "/imageScreen",
        builder: (context, state) => const ImageScreen(),
      ),
      GoRoute(
        name: "HomeScreen",
        path: "/home",
        builder: (context, state) => const Home(),
      )
    ],
    refreshListenable: GoRouterRefreshStream(loginCubit.stream),
  );
}

//converting the LoginCubit stream to  Listenable

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
