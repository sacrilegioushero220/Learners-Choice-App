import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileDataRepository repository;
  ProfileBloc(this.repository) : super(ProfileInitialState()) {
    on<SaveNameEvent>(_saveNameEvent);
    on<PickImageEvent>(_pickImageEvent);
    on<SaveProfileEvent>(_saveProfileEvent);
  }

  FutureOr<void> _saveNameEvent(
      SaveNameEvent event, Emitter<ProfileState> emit) {
    final String profileName = event.profileName;

    emit(NameEnteredState(profileName));
  }

  FutureOr<void> _pickImageEvent(
      PickImageEvent event, Emitter<ProfileState> emit) async {
    // logic to launch image picker and set _profilePicPath
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final String profilePicPath = image.path;
      // ImagePicked event with the selected image path
      emit(ImagePickedState(profilePicPath));
    }
  }

  FutureOr<void> _saveProfileEvent(
      SaveProfileEvent event, Emitter<ProfileState> emit) async {
    emit(SavingProfileState());

    try {
      await repository.saveProfile(event.profileName, event.profilePicPath);
      emit(ProfileSavedState());
    } catch (e) {
      emit(ErrorState('Error saving profile: $e'));
    }
  }
}
