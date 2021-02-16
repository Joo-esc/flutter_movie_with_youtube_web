class Youtube {
  String title;
  String videoId;

  // String title;

  Youtube({this.title, this.videoId});

  factory Youtube.fromJson(Map<String, dynamic> json) {
    return Youtube(
      videoId: json['id']['videoId'],
      title: json['snippet']['title'],
      // title: json['snippet']['title'],
      // title: json['etag'],
    );
  }
}

//
// class Youtube {
//   String videoId;
//   // String title;
//
//   Youtube({
//     this.videoId,
//   });
//
//   factory Youtube.fromJson(Map<String, dynamic> json) {
//     return Youtube(
//       videoId: json['videoId'],
//       // title: json['etag'],
//     );
//   }
// }
