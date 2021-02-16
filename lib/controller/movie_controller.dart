import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moview_web/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:moview_web/model/youtube.dart';

class MovieController extends GetxController {
  String _selectedTitle;
  String get selectedTitle => _selectedTitle;

  set selectedTitle(String value) {
    update();
    _selectedTitle = value;
  }

  String _selectedId;
  String get selectedId => _selectedId;
  RxInt count = 0.obs;
  List<Movie> _movieList = [];
  List<Youtube> _youtubeList = [];

  List<Youtube> get youtubeList => _youtubeList;

  set youtubeList(List<Youtube> value) {
    update();
    _youtubeList = value;
  }

  set selectedId(String value) {
    update(); //notifie
    _selectedId = value;
  }

  List<Movie> get movieList => _movieList;

  set movieList(List<Movie> value) {
    update();
    _movieList = value;
  }

  getMovies(MovieController movieController) async {
    Future.delayed(Duration.zero, () async {
      final data = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=239073ac9013319bd7a0c03a2533b982&language=ko&page=1®ion=KR',
      );
      // final result = jsonDecode(data.body);
      var parsed = jsonDecode(data.body)['results'];
      List<Movie> _movieLista =
          List<Movie>.from(parsed.map((i) => Movie.fromJson(i)));
      movieController.movieList = _movieLista;
    });
  }

  // getYoutube(MovieController movieController) async {
  //   Future.delayed(Duration.zero, () async {
  //     final data = await http.get(
  //         'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=어벤져스리뷰&type=video&key=AIzaSyDiso0MRPiMzF5Fm35_9lymcJcCjCqN53M');
  //     // 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=%EC%9B%90%EB%8D%94%EC%9A%B0%EB%A8%BC1984%EB%A6%AC%EB%B7%B0&type=video&key=AIzaSyDiso0MRPiMzF5Fm35_9lymcJcCjCqN53M');
  //     // final result = jsonDecode(data.body);
  //     var parsed = jsonDecode(data.body)['items'];
  //     List<Youtube> _youtubeLista =
  //         List<Youtube>.from(parsed.map((i) => Youtube.fromJson(i)));
  //     movieController.youtubeList = _youtubeLista;
  //   });
  // }
}

// import 'dart:convert';
// import 'package:cloud_firestore/cloud_fires tore.dart';
// import 'package:get/get.dart';
// import 'package:moview_web/model/movie_model.dart';
// import 'package:http/http.dart' as http;
//
// class MovieController extends GetxController {
//   String _selectedId;
//
//   String get selectedId => _selectedId;
//
//   set selectedId(String value) {
//     update(); //notifie
//     _selectedId = value;
//   }
//
//   RxInt count = 0.obs;
//   List<Movie> _movieList = [];
//   List<Movie> get movieList => _movieList;
//
//   set movieList(List<Movie> value) {
//     update();
//     _movieList = value;
//   }
//
//   getMovies(MovieController movieController) async {
//     Future.delayed(Duration.zero, () async {
//       final data = await http.get(
//         'https://api.themoviedb.org/3/movie/now_playing?api_key=239073ac9013319bd7a0c03a2533b982',
//       );
//       final result = jsonDecode(data.body);
//       var parsed = json.decode(data.body)['results'];
//       var list = parsed.map((i) => Movie.fromJson(i)).toList();
//       List<Movie> _movieLista =
//       List<Movie>.from(parsed.map((i) => Movie.fromJson(i)));
//       // List<Movie> _movieLista = [];
//       // _movieLista = result['results'];
//       movieController.movieList = _movieLista;
//     });
//   }
// }
