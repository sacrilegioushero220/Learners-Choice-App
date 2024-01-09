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
      'profileOnboardStatus': profileOnboardStatus.index
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileName': profileName,
      'profilePic': profilePic,
      'profileOnboardStatus': profileOnboardStatus.index,
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      json['id'],
      profileName: json['profileName'],
      profilePic: json['profilePic'],
      profileOnboardStatus:
          ProfileOnboardStatus.values[json['profileOnboardStatus']],
    );
  }
}
