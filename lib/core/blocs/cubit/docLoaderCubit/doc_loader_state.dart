import 'package:equatable/equatable.dart';
import 'package:learners_choice_app/model/driver_acts/driver_acts.dart';

abstract class DocLoaderState extends Equatable {
  @override
  List<Object> get props => [];
}

class DocLoaderInitial extends DocLoaderState {}

class DocLoading extends DocLoaderState {}

class DriverActsLoaded extends DocLoaderState {
  final List<DriverActs> driverActs;

  DriverActsLoaded({required this.driverActs});

  @override
  List<Object> get props => [driverActs];
}

class DocLoaderError extends DocLoaderState {
  final String message;

  DocLoaderError({required this.message});

  @override
  List<Object> get props => [message];
}
