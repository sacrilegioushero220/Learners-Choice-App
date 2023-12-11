import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/app.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';

import 'core/blocs/data_bloc/data_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DataBloc(),
      ),
      BlocProvider(
        create: (context) => ProfileBloc(),
      ),
    ],
    child: const App(),
  ));
}
