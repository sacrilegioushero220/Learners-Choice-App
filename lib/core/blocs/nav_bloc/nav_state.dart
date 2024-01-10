part of 'nav_bloc.dart';

sealed class NavState {}

final class NavInitial extends NavState {}

final class NavigateNameScreenState extends NavState {}

final class NavigateImageScreenState extends NavState {}

final class NavigateHomeScreenState extends NavState {}

final class ProfileOnboardedState extends NavState {
  final Profile? profile;

  ProfileOnboardedState({required this.profile});

  Map<String, dynamic> toJson() {
    return {
      'type': 'ProfileOnboardedState',
      'profile':
          profile?.toJson(), // Assuming Profile has its own toJson method
    };
  }

  factory ProfileOnboardedState.fromJson(Map<String, dynamic> json) {
    return ProfileOnboardedState(
      profile: Profile.fromJson(json['profile']),
    );
  }
}

final class ProfileNotOnboardedState extends NavState {}
