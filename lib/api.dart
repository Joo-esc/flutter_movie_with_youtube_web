// import 'dart:convert';
// import 'controller/movie_controller.dart';
// import 'package:http/http.dart' as http;
// import 'model/movie_model.dart';
//
// getMovies(MovieController movieController) async {
//   Future.delayed(Duration.zero, () async {
//     final data = await http.get(
//       'https://api.themoviedb.org/3/movie/popular?api_key=239073ac9013319bd7a0c03a2533b982&language=ko&page=1®ion=KR',
//     );
//     // final result = jsonDecode(data.body);
//     var parsed = jsonDecode(data.body)['results'];
//     movieController.movieList =
//         List<Movie>.from(parsed.map((i) => Movie.fromJson(i)));
//   });
// }
