class Movie {
  int id;
  String image;
  String title;
  String description;
  String releaseDate;
  Movie({this.id, this.image, this.title, this.description, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      image: json['poster_path'],
      title: json['title'],
      description: json['overview'],
      releaseDate: json['release_date'],
    );
  }
}
