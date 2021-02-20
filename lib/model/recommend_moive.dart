class RecommendMovie {
  int id;
  String image;
  String title;
  String description;
  String releaseDate;
  List youtubeLink;
  RecommendMovie(
      {this.id,
      this.image,
      this.title,
      this.description,
      this.releaseDate,
      this.youtubeLink});

  RecommendMovie.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
    title = data['title'];
    description = data['description'];
    releaseDate = data['year'];
    youtubeLink = data['youtubeLink'];
  }
}
