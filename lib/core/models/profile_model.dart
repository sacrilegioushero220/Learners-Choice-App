class Profile {
  final int? id;
  final String profileName;
  final String profilePic;

  const Profile(
    this.id, {
    required this.profileName,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileName': profileName,
      'profilePic': profilePic,
    };
  }
}
