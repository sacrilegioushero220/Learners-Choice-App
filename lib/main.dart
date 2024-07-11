import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/app.dart';
import 'package:learners_choice_app/core/blocs/bloc_observer.dart';
import 'package:learners_choice_app/core/blocs/cubit/apiCubit/api_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_cubit.dart';
import 'package:learners_choice_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ApiCubit(),
      ),
      BlocProvider(
        create: (context) => LocalStorageCubit(),
      ),
      BlocProvider(
        create: (context) => QuizCubit(DefaultCacheManager()),
      ),
      BlocProvider(
        create: (context) => DocLoaderCubit(DefaultCacheManager()),
      ),
    ],
    child: const App(),
  ));
}
