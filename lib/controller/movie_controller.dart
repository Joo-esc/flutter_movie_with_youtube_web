import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:moview_web/model/movie_model.dart';

class MovieController extends GetxController {
  List<Movie> _movieList = [];
  List<Movie> get movieList => _movieList;

  RxInt count = 0.obs;

  set movieList(List<Movie> value) {
    update();
    _movieList = value;
  }

  // Get snapshot into controller
  getMovie(MovieController movieController) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('movies').get();

    List<Movie> _movieLista = [];

    snapshot.docs.forEach((document) {
      Movie movie = Movie.fromMap(document.data());
      _movieLista.add(movie);
    });

    movieController._movieList = _movieLista;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:moview_web/model/movie_model.dart';
//
// class MovieController extends GetxController {
//   List<Movie> _movieList = [];
//   int _selectedIndex;
//   RxInt _aimIndex = 0.obs;
//
//   RxInt get aimIndex => _aimIndex;
//
//   set aimIndex(RxInt value) {
//     update();
//     _aimIndex = value;
//   }
//
//   int get selectedIndex => _selectedIndex;
//
//   set selectedIndex(int value) {
//     update();
//     _selectedIndex = value;
//   }
//
//   List<Movie> get movieList => _movieList;
//
//   set movieList(List<Movie> value) {
//     update();
//     _movieList = value;
//   }
//
//   getMovie(MovieController movieController) async {
//     QuerySnapshot snapshot =
//     await FirebaseFirestore.instance.collection('movies').get();
//     List<Movie> _movieLista = [];
//
//     snapshot.docs.forEach((document) {
//       Movie movie = Movie.fromMap(document.data());
//       _movieLista.add(movie);
//     });
//
//     movieController._movieList = _movieLista;
//   }
// }
