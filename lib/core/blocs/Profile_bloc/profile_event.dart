part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class WriteProfile extends ProfileEvent {
  final String? profileName;
  final String? profilePic;

  WriteProfile({this.profileName, this.profilePic});
}

final class ReadProfile extends ProfileEvent {}

final class UpdateProfile extends ProfileEvent {}

final class DeleteProfile extends ProfileEvent {}
