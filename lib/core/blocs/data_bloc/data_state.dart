part of 'data_bloc.dart';

sealed class DataState {}

final class DataInitialState extends DataState {}

final class DataLoadingState extends DataState {}

final class DataLoadedState extends DataState {}

final class DataErrorState extends DataState {}
