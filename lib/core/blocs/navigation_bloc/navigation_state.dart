part of 'navigation_bloc.dart';

sealed class NavigationState {}

final class NavigationInitialState extends NavigationState {}

final class UserOnboardedState extends NavigationState {}

final class NavigationErrorState extends NavigationState {
  final String errorMessage;

  NavigationErrorState({required this.errorMessage});
}
