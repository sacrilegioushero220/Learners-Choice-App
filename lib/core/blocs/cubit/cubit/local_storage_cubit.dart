import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learners_choice_app/Presentation/presentation_layer.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_state.dart';

class LocalStorageCubit extends Cubit<LocalStorageState> {
  LocalStorageCubit() : super(LocalStorageInitial());
  // Function to save name to shared preferences
  Future<void> saveName(String name, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    emit(NameSaved(name));
  }

  // Function to print the stored name from shared preferences
  Future<void> getProfilePic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profilePic = prefs.getString('profilePic');
    if (profilePic != null) {
      emit(ProfilePicFetchState(profilePic: profilePic));
      print('Stored Name: $profilePic');
    } else {
      print('No name stored');
    }
  }

  // Function to print the stored name from shared preferences
  Future<void> printStoredPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('profilePic');
    if (storedName != null) {
      print('Stored Name: $storedName');
    } else {
      print('No name stored');
    }
  }

  // Function to pick an image and save its path in shared preferences
  Future<void> pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profilePic', pickedFile.path);
      emit(ImagePicked(pickedFile.path));
    }
  }

  Future<void> saveOnboardStatus(bool isOnboarded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboarded', isOnboarded);
    emit(OnboardedState());
  }

  Future<void> checkOnboardStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isOnboarded = prefs.getBool('isOnboarded');
    if (isOnboarded != null && isOnboarded == true) {
      emit(OnboardedState());
    } else {
      emit(NotOnboardedState());
    }
  }

  Future<void> updateProfile(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    String? profilePic = prefs.getString('profilePic');
    emit(ProfileUpdatedState(
        profileName: name, profilePic: profilePic.toString()));
    print("Profile is updatedstate");
  }
}
