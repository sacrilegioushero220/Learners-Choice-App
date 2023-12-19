// import 'dart:async';


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
// part 'data_event.dart';
// part 'data_state.dart';

// class DataBloc extends Bloc<DataEvent, DataState> {
//   DataBloc() : super(DataInitialState()) {
//     on<InitializeDatabase>(_loadDataEvent);
//   }
// }

// FutureOr<void> _loadDataEvent(
//     InitializeDatabase event, Emitter<DataState> emit) async {
//   const String databasePath = 'lib/data/mydatabase.db';

//   try {
//     Database database = await openDatabase(
//       databasePath,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//           "CREATE TABLE profileData (id INTEGER PRIMARY KEY, profileName TEXT, profilePic TEXT )",
//         );
//       },
//     );
//     emit(DataLoadingState());
//   } catch (e) {
//     print(e.toString());
//     emit(DataErrorState(errorMessage: e.toString()));
//   }
// }
