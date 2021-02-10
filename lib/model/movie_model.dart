class Movie {
  String image;
  String description;
  String rating;
  String title;
  int likes;
  String year;
  // HomeDetailDesktop
  Movie(this.image, this.description, this.rating, this.likes);

  Movie.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    description = data['description'];
    rating = data['rating'];
    likes = data['likes'];
    year = data['year'];
    title = data['title'];
  }
}
