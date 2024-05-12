part of 'local_storage_cubit.dart';

sealed class LocalStorageState {}

final class LocalStorageInitial extends LocalStorageState {}

class NameSaved extends LocalStorageState {
  final String name;

  NameSaved(this.name);
}

class ImagePicked extends LocalStorageState {
  final String imagePath;

  ImagePicked(this.imagePath);
}

class OnboardState extends LocalStorageState {
  final bool isOnboarded;

  OnboardState(this.isOnboarded);
}

class ProfilePicFetchState extends LocalStorageState {
  final String profilePic;

  ProfilePicFetchState({required this.profilePic});
}

class OnboardedState extends LocalStorageState {}

class NotOnboardedState extends LocalStorageState {}

class ProfileUpdatedState extends LocalStorageState {
  final String profilePic;
  final String profileName;

  ProfileUpdatedState({
    required this.profileName,
    required this.profilePic,
  });
}
