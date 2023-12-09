import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/app.dart';

import 'core/blocs/data_bloc/data_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DataBloc(),
    child: const App(),
  ));
}
