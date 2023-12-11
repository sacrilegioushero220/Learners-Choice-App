import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/config/app_router.dart';
import 'package:learners_choice_app/core/Theme/color_schemes.g.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';
import 'package:learners_choice_app/core/blocs/data_bloc/data_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context).add(InitializeDatabase());
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
