import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:moview_web/controller/movie_controller.dart';
import 'package:moview_web/controller/youtube_controller.dart';
import 'package:moview_web/model/youtube.dart';
import 'package:moview_web/utill/default.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// flutter run -d chrome --web-hostname localhost --web-port 5000
class HomeScreenTablet extends StatefulWidget {
  @override
  _HomeScreenTabletState createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  //Youtube controller
  YoutubePlayerController _controller;
  int kHeaderFontSize;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final controller = Get.put(MovieController());
  final youController = Get.put(YoutubeController());
  final _message = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;
  int selectedIndex = 0;
  int selectedType;
  bool sectionChange = true;
  String textValue;
  List<String> youtubeId = [
    'nPt8bK2gbaU',
    'K18cpp_-gP8',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
  ];
  @override
  void initState() {
    final controller = Get.put(MovieController());
    final youtubeController = Get.put(YoutubeController());
    youtubeController.getYoutube(youtubeController);
    controller.getMovies(controller);
    YoutubePlayerController _controller;
    controller.selectedTitle = 'smae for what';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      final data = await http.get(
          'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=${controller.selectedTitle}영화리뷰&type=video&key=AIzaSyDGoLYO_ovt4VccW_JlOy2PKdIE2bP7H-E');
      // 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=어벤져스리뷰&type=video&key=AIzaSyDiso0MRPiMzF5Fm35_9lymcJcCjCqN53M');
      // 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=%EC%9B%90%EB%8D%94%EC%9A%B0%EB%A8%BC1984%EB%A6%AC%EB%B7%B0&type=video&key=AIzaSyDiso0MRPiMzF5Fm35_9lymcJcCjCqN53M');
      // final result = jsonDecode(data.body);
      var parsed = jsonDecode(data.body)['items'];
      List<Youtube> _youtubeLista =
          List<Youtube>.from(parsed.map((i) => Youtube.fromJson(i)));
      youController.youtubeList = _youtubeLista;
    });
    // sectionChange = false;
    return Container();
  }
}
