import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/models/profile_model.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';
part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  final ProfileDataRepository repository;
  NavBloc(this.repository) : super(NavInitial()) {
    on<NavigatetoNameScreenEvent>(_navigatetoNameScreenEvent);
    on<NavigatetoImageScreenEvent>(_navigatetoImageScreenEvent);
    on<NavigatetoHomeScreenEvent>(_navigatetoHomeScreenEvent);
    on<OnboardProfileEvent>(_onboardProfileEvent);
  }

  FutureOr<void> _navigatetoNameScreenEvent(
      NavigatetoNameScreenEvent event, Emitter<NavState> emit) {
    emit(NavigateNameScreenState());
  }

  FutureOr<void> _navigatetoImageScreenEvent(
      NavigatetoImageScreenEvent event, Emitter<NavState> emit) {
    emit(NavigateImageScreenState());
  }

  FutureOr<void> _navigatetoHomeScreenEvent(
      NavigatetoHomeScreenEvent event, Emitter<NavState> emit) {
    emit(NavigateHomeScreenState());
  }

  FutureOr<void> _onboardProfileEvent(
      OnboardProfileEvent event, Emitter<NavState> emit) async {
    try {
      final existingProfile = await repository.getLatestProfile();
      if (existingProfile != null) {
        emit(ProfileOnboardedState(profile: existingProfile));
        print("state is ProfileOnboarded ");
      } else {
        emit(ProfileNotOnboardedState());
        print("state is ProfileNotOnboarded ");
      }
    } catch (e, stacktrace) {
      print(
          "there is issue with OnboardProfileEvent and error is : $e, the stacktrace : $stacktrace");
    }
  }
}
