import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ProfileDataRepository repository;
  LoginCubit(this.repository) : super(const LoginState.unauthenticated());

  void login() {
    emit(const LoginState.authenticated());
  }

  void logOut() {
    emit(const LoginState.unauthenticated());
  }

  Future<void> checkAuthentication() async {
    try {
      final existingProfile = await repository.getLatestProfile();
      if (existingProfile != null) {
        emit(const LoginState.authenticated());
        print("LoginState Authenticated");
      } else {
        emit(const LoginState.unauthenticated());
        print("state is ProfileNotOnboarded ");
      }
    } catch (e, stacktrace) {
      print(
          "there is issue with OnboardProfileEvent and error is : $e, the stacktrace : $stacktrace");
    }
    return;
  }
}
