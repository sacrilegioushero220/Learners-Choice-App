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
    on<PickNameEvent>(_saveNameEvent);
    on<PickImageEvent>(_pickImageEvent);
    on<SaveProfileEvent>(_saveProfileEvent);
    on<DisplayProfileEvent>(_displayProfileEvent);
  }

  FutureOr<void> _saveNameEvent(
      PickNameEvent event, Emitter<ProfileState> emit) {
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
    } catch (e, stackTrace) {
      print(e);
      print('Error: $e\nStack Trace: $stackTrace');
      emit(ErrorState('Error saving profile: $e'));
    }
  }

  FutureOr<void> _displayProfileEvent(
    DisplayProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final latestProfile = await repository.getLatestProfile();

      if (latestProfile != null) {
        // Do something with the latest profile
        final profileName = latestProfile.profileName;
        final profilePic = latestProfile.profilePic;
        emit(ProfileQueriedState(
            profileName: profileName, profilePic: profilePic));
        print('Latest Profile: $profileName $profilePic');
        print("Profile Queried state");
      } else {
        // No profiles found
        print('No profiles found');
      }
    } catch (e, stackTrace) {
      print(e);
      print('Error: $e\nStack Trace: $stackTrace');
      // Handle errors here
    }
  }
}
