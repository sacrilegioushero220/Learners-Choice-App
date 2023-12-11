import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/core/models/profile_model.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<WriteProfile>(_writeProfile);
  }
}

FutureOr<void> _writeProfile(
  WriteProfile event,
  Emitter<ProfileState> emit,
) {
  final profile = Profile(
    profileName: event.profileName,
    profilePic: event.profilePic,
  );
}
