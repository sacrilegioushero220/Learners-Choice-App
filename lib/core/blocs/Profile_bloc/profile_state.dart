part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class NameEnteredState extends ProfileState {
  final String profileName;
  NameEnteredState(this.profileName);

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'type': 'NameEnteredState',
      'profileName': profileName,
    };
  }

  // Create an instance of the object from a JSON representation
  factory NameEnteredState.fromJson(Map<String, dynamic> json) {
    return NameEnteredState(
      json['profileName'],
    );
  }
}

final class ImagePickedState extends ProfileState {
  final String profileImagePath;
  ImagePickedState(this.profileImagePath);

  Map<String, dynamic> toJson() {
    return {
      'type': 'ImagePickedState',
      'profileImagePath': profileImagePath,
    };
  }

  factory ImagePickedState.fromJson(Map<String, dynamic> json) {
    return ImagePickedState(
      json['profileImagePath'],
    );
  }
}

final class SavingProfileState extends ProfileState {}

final class ProfileSavedState extends ProfileState {}

final class ProfileQueriedState extends ProfileState {
  final String? profileName;
  final String? profilePic;

  ProfileQueriedState({
    required this.profileName,
    required this.profilePic,
  });
  Map<String, dynamic> toJson() {
    return {
      'type': 'ProfileQueriedState',
      'profileName': profileName,
      'profilePic': profilePic,
    };
  }

  factory ProfileQueriedState.fromJson(Map<String, dynamic> json) {
    return ProfileQueriedState(
      profileName: json['profileName'],
      profilePic: json['profilePic'],
    );
  }
}

class ErrorState extends ProfileState {
  final String error;
  ErrorState(this.error);
  Map<String, dynamic> toJson() {
    return {
      'type': 'ErrorState',
      'error': error,
    };
  }

  factory ErrorState.fromJson(Map<String, dynamic> json) {
    return ErrorState(
      json['error'],
    );
  }
}
