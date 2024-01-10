import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/nav_bloc/nav_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navBloc = BlocProvider.of<NavBloc>(context);
    return Container();
  }
}
