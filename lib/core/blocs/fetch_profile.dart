import 'package:learners_choice_app/core/models/profile_model.dart';
import 'package:learners_choice_app/data/repository/profile_repo.dart';

Future<Profile?> fetchProfileMethod() async {
  final repository = ProfileDataRepository();
  try {
    final latestProfile = await repository.getLatestProfile();

    if (latestProfile != null) {
      // Create Profile object with required arguments
      final newProfile = Profile(
        latestProfile.id, // Assuming id is present in latestProfile
        profileName: latestProfile.profileName,
        profilePic: latestProfile.profilePic,
        profileOnboardStatus:
            ProfileOnboardStatus.onboarded, // Optional argument
      );

      return newProfile;
    } else {
      // No profiles found
      print('No profiles found');
      return null;
    }
  } catch (e, stackTrace) {
    print(e);
    print('Error: $e\nStack Trace: $stackTrace');
    // Handle errors here
  }
  return null;
}
