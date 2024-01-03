part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class NameEnteredState extends ProfileState {
  final String profileName;
  NameEnteredState(this.profileName);
}

final class ImagePickedState extends ProfileState {
  final String profileImagePath;
  ImagePickedState(this.profileImagePath);
}

final class SavingProfileState extends ProfileState {}

final class ProfileSavedState extends ProfileState {}

final class ProfileQueriedState extends ProfileState {
  final Profile? profile;

  ProfileQueriedState({required this.profile});
}

class ErrorState extends ProfileState {
  final String error;
  ErrorState(this.error);
}
