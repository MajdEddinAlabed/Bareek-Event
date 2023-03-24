class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final String social;
  final bool isFollowing;

  const User(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.about,
      required this.social,
      required this.isFollowing});
}
