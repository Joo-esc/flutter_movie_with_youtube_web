import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moview_web/controller/movie_controller.dart';
import 'package:moview_web/utill/default.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreenTablet extends StatefulWidget {
  @override
  _HomeScreenTabletState createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  int kHeaderFontSize;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final controller = Get.put(MovieController());
  int selectedIndex = 0;
  @override
  void initState() {
    final controller = Get.put(MovieController());
    controller.getMovie(controller);
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
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            controller.movieList[selectedIndex].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
          child: Container(
            margin: EdgeInsets.only(left: 61, top: 73),
            // color: Colors.grey.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO Section 1 (Big Cateogry)
                Row(
                  children: [
                    Text(
                      '전체',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '국내',
                        style: TextStyle(
                            fontSize: 26,
                            color: Color(0xFF616161),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '해외',
                      style: TextStyle(
                          fontSize: 26,
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 64),
                //TODO Section 2 Title & information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.movieList[selectedIndex].title,
                      style: GoogleFonts.staatliches(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 96,
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    //TODO ==> (개봉연도, 관람가)
                    Row(
                      children: [
                        Container(
                          height: 27,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color(0xFF6E6E6E),
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text(
                              '${controller.movieList[selectedIndex].rating}세 이상 관람과',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          controller.movieList[selectedIndex].year,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    //TODO About Descritption
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      controller.movieList[selectedIndex].description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1,
                          wordSpacing: 0.8,
                          height: 1.4),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //TODO 리뷰영상
                        Container(
                          width: 156,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFFFE24B),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.youtube,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Youtube 리뷰 영상',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: 6),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 86,
                              height: 36,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '예고편',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 136,
                              height: 36,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_circle_outline,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        '관심목록에 추가',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //TODO SWIPER
              ],
            ),
          ),
        ),
        Positioned(
          left: 61,
          bottom: 0,
          child: Container(
            margin: EdgeInsets.only(bottom: 40),
            width: MediaQuery.of(context).size.width,
            height: 345,
            // height: MediaQuery.of(context).size.height * 0.39,
            child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: controller.movieList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      itemScrollController.scrollTo(
                          index: selectedIndex,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOutCubic);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 236,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          controller.movieList[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
