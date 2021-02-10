import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:moview_web/controller/movie_controller.dart';
import 'package:moview_web/utill/default.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeDetailDesktop extends StatefulWidget {
  @override
  _HomeDetailDesktopState createState() => _HomeDetailDesktopState();
}

class _HomeDetailDesktopState extends State<HomeDetailDesktop> {
  int kHeaderFontSize;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final controller = Get.put(MovieController());
  int selectedIndex = 0;
  int selectedType = 0;
  @override
  void initState() {
    final controller = Get.put(MovieController());
    controller.getMovie(controller);
    controller.getMovieA(controller);
    controller.getMovieB(controller);
    int selectedIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(children: [
        // TODO Background  box(left) , image(right)
        Row(
          children: [
            Container(
              // width: 296,
              width: MediaQuery.of(context).size.width * 0.205,
              height: double.infinity,
              color: kSidebarColor,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(child: Builder(builder: (context) {
                    if (selectedType == 0) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller
                                .movieList[controller.count.value].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else if (selectedType == 1) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller
                                .movieListA[controller.count.value].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller
                                .movieListB[controller.count.value].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  })),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.centerRight,
                            end: FractionalOffset.centerLeft,
                            colors: [
                              Color(0xFF1D1D1D).withOpacity(0.5),
                              Color(0xFF1D1D1D),
                            ],
                            stops: [
                              0.0,
                              1.0
                            ])),
                  )
                ],
              ),
            ),
          ],
        ),
        //TODO Section Container Layout
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 660,
            maxWidth: 662,
            minHeight: 490,
            maxHeight: 510,
          ),
          child: GestureDetector(
            onTap: () {
              print(controller.count.value);
            },
          ),
        ),
      ]),
    );
  }
}
