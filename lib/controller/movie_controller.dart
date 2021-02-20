import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moview_web/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:moview_web/model/people.dart';
import 'package:moview_web/model/recommend_moive.dart';
import 'package:moview_web/model/youtube.dart';

class MovieController extends GetxController {
  int _movieId;
  String _selectedTitle;
  String _selectedId;
  String get selectedId => _selectedId;
  RxInt count = 0.obs;
  List<Movie> _movieList = [];
  List<Youtube> _youtubeList = [];
  List<People> _peopleList = [];
  List<RecommendMovie> _recommendList = [];

  List<RecommendMovie> get recommendList => _recommendList;
  set recommendList(List<RecommendMovie> value) {
    update();
    _recommendList = value;
  }

  int get movieId => _movieId;
  set movieId(int value) {
    update();
    _movieId = value;
  }

  List<People> get peopleList => _peopleList;
  set peopleList(List<People> value) {
    update();
    _peopleList = value;
  }

  String get selectedTitle => _selectedTitle;
  set selectedTitle(String value) {
    update();
    _selectedTitle = value;
  }

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
      if (data.statusCode == 200) {
        var parsed = jsonDecode(data.body)['results'];
        List<Movie> _movieLista =
            List<Movie>.from(parsed.map((i) => Movie.fromJson(i)));
        movieController.movieList = _movieLista;
      } else {
        throw Exception('Failed to load the movies');
      }
    });
  }

  getRecommendMovie(MovieController movieController) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('movies').get();

    List<RecommendMovie> _recommendlista = [];

    snapshot.docs.forEach((document) {
      RecommendMovie recommendMovie = RecommendMovie.fromMap(document.data());
      _recommendlista.add(recommendMovie);
    });
    movieController.recommendList = _recommendlista;
  }

  @override
  void onInit() {
    super.onInit();
    ever(count, (_) {
      print('same as you think');
    });
  }
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
