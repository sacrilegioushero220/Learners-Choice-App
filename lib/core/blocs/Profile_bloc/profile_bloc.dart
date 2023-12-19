import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileDataRepository repository;
  ProfileBloc(this.repository) : super(ProfileInitialState());

  String _profileName = '';
  String _profilePicPath = '';

  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    switch (event.runtimeType) {
      case SaveNameEvent:
        _profileName = (event as SaveNameEvent).profileName;
        yield NameEnteredState(_profileName);
        break;

      case PickImageEvent:
        // logic to launch image picker and set _profilePicPath

        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          _profilePicPath = image.path;
          // ImagePicked event with the selected image path
          yield ImagePickedState(_profilePicPath);
        }

        break;

      case SaveProfileEvent:
        // Create instance
        yield SavingProfileState();

        try {
          _profileName = (event as SaveProfileEvent).profileName;
          _profilePicPath = (event as SaveProfileEvent).profilePicPath;

          //  logic to save profile to the database

          await repository.saveProfile(_profileName, _profilePicPath);
          yield ProfileSavedState();
        } catch (e) {
          yield ErrorState('Error saving profile: $e');
        }
        break;
    }
  }
}
