import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/config/app_router.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';
import 'package:learners_choice_app/core/blocs/cubit/login_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    loginCubit.checkAuthentication();

    return Builder(builder: (context) {
      return MaterialApp.router(
        routerConfig: AppRouter(loginCubit: loginCubit).appRouter,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            textTheme: CustomTextTheme.customDarkTextTheme),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
