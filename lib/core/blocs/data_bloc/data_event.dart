part of 'data_bloc.dart';

sealed class DataEvent {}

final class LoadDataEvent extends DataEvent {}

final class WriteDataEvent extends DataEvent {}

final class DeleteDataEvent extends DataEvent {}
