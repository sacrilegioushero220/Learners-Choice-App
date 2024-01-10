part of 'nav_bloc.dart';

sealed class NavEvent {}

final class NavigatetoNameScreenEvent extends NavEvent {}

final class NavigatetoImageScreenEvent extends NavEvent {}

final class NavigatetoHomeScreenEvent extends NavEvent {}

final class OnboardProfileEvent extends NavEvent {}
