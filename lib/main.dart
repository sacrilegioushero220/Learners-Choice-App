import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learners_choice_app/app.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';
import 'package:learners_choice_app/core/blocs/nav_bloc/nav_bloc.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';
import 'package:path_provider/path_provider.dart';
import 'core/blocs/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProfileBloc(ProfileDataRepository()),
      ),
      BlocProvider(
        create: (context) => NavBloc(ProfileDataRepository()),
      ),
    ],
    child: const App(),
  ));
}
