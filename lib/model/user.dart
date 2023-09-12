class User {
  final String name;
  final String slackUserName;
  final String imageUrl;
  final String bio;

  User({
    required this.name,
    required this.slackUserName,
    required this.imageUrl,
    required this.bio,
  });

  @override
  String toString() {
    return 'User(name: $name, slackUserName: $slackUserName, imageUrl: $imageUrl, bio: $bio)';
  }

  User copyWith({
    String? name,
    String? slackUserName,
    String? imageUrl,
    String? bio,
  }) {
    return User(
      name: name ?? this.name,
      slackUserName: slackUserName ?? this.slackUserName,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
    );
  }
}
