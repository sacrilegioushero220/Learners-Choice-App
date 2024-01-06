part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class PickNameEvent extends ProfileEvent {
  final String profileName;

  PickNameEvent({required this.profileName});
}

final class PickImageEvent extends ProfileEvent {}

final class SaveProfileEvent extends ProfileEvent {
  final String profileName;

  final String profilePicPath;

  SaveProfileEvent({required this.profileName, required this.profilePicPath});
}

final class DisplayProfileEvent extends ProfileEvent {}
