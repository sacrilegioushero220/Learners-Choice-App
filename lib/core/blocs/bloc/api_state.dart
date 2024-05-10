part of 'api_bloc.dart';

@immutable
sealed class ApiState {}

final class ApiInitial extends ApiState {}

final class ImagePickedState extends ApiState {
  // final String profileImagePath;
  // ImagePickedState(this.profileImagePath);
}
