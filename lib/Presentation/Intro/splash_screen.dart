import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/blocs/fetch_profile.dart';
import 'package:learners_choice_app/core/models/profile_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: fetchProfileMethod(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: SplashScreen(),
            ),
          );
        } else if (snapshot.hasError) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Restart');
                  // Restart the app when "Restart" is pressed
                },
                child: const Text("Ok"),
              ),
            ],
            content: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final profile = snapshot.data!;
          // Use the retrieved profile for UI updates
          return Container(
            // ... (Use profile data here)
            color: Colors.white,
            child: Text(profile.toString()),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Unexpected error occurred.'),
            ),
          );
        }
      },
    );
  }
}
