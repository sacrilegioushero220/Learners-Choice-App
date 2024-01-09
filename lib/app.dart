import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/config/app_router.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    final profileBloc = BlocProvider.of<ProfileBloc>(context, listen: false);
    profileBloc.add(OnboardProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter(
              profileBloc: BlocProvider.of<ProfileBloc>(context, listen: false))
          .appRouter,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: CustomTextTheme.customDarkTextTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}
