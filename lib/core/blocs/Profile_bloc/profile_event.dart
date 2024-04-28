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
  final ProfileOnboardStatus status;

  SaveProfileEvent(
      {required this.profileName,
      required this.profilePicPath,
      required this.status});
}

final class DisplayProfileEvent extends ProfileEvent {}

final class FetchProfileEvent extends ProfileEvent {}

final class OnboardProfileEvent extends ProfileEvent {}
