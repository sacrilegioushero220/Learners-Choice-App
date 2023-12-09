import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitialState()) {
    on<LoadDataEvent>(_loadDataEvent);
  }
}

FutureOr<void> _loadDataEvent(LoadDataEvent event, Emitter<DataState> emit) {}
