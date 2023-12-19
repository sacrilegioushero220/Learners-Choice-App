part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class SaveNameEvent extends ProfileEvent {
  final String profileName;

  SaveNameEvent({required this.profileName});
}

final class PickImageEvent extends ProfileEvent {
  final String profilePicPath;

  PickImageEvent(this.profilePicPath);
}

final class SaveProfileEvent {
  final String profileName;

  final String profilePicPath;

  SaveProfileEvent({required this.profileName, required this.profilePicPath});
}
