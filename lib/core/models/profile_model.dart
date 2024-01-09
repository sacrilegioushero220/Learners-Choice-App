enum ProfileOnboardStatus { onboarded, notOnboarded }

class Profile {
  final int? id;
  ProfileOnboardStatus profileOnboardStatus;
  final String profileName;
  final String profilePic;

  Profile(
    this.id, {
    required this.profileName,
    required this.profilePic,
    this.profileOnboardStatus = ProfileOnboardStatus.notOnboarded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileName': profileName,
      'profilePic': profilePic,
      'profileOnboardStatus': profileOnboardStatus
    };
  }
}
