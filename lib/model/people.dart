class People {
  String name;
  String character;
  String profileImage;

  People({this.name, this.character, this.profileImage});

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      name: json['name'],
      character: json['character'],
      profileImage: json['profile_path'],
    );
  }
}
