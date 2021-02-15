import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moview_web/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  String _selectedId;

  String get selectedId => _selectedId;

  set selectedId(String value) {
    update(); //notifie
    _selectedId = value;
  }

  RxInt count = 0.obs;
  List<Movie> _movieList = [];
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

      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('movies').get();
      snapshot.docs.forEach((document) {
        Movie movie = Movie.fromJson(document.data());
      });
    });
  }
}

// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
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
