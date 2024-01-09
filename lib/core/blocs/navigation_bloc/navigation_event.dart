part of 'navigation_bloc.dart';

sealed class NavigationEvent {}

final class InitializeDatabase extends NavigationEvent {}

final class UserOnboardEvent extends NavigationEvent {}
