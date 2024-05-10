import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const ImageScreen()));
    // Navigate to the next screen or perform any other action
  }

  // Function to print the stored name from shared preferences
  Future<void> printStoredName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('name');
    if (storedName != null) {
      print('Stored Name: $storedName');
    } else {
      print('No name stored');
    }
  }
}
