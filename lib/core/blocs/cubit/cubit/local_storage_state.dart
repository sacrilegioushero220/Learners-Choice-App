part of 'local_storage_cubit.dart';

sealed class LocalStorageState {}

final class LocalStorageInitial extends LocalStorageState {}

class NameSaved extends LocalStorageState {
  final String name;

  NameSaved(this.name);
}
