// import 'dart:convert';
// import 'dart:core';
//
// import 'package:http/http.dart' as http;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:group_button/group_button.dart';
// import 'package:moview_web/api.dart';
// import 'package:moview_web/controller/movie_controller.dart';
// import 'package:moview_web/controller/youtube_controller.dart';
// import 'package:moview_web/model/movie_model.dart';
// import 'package:moview_web/model/people.dart';
// import 'package:moview_web/model/youtube.dart';
// import 'package:moview_web/utill/default.dart';
//
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:sizer/sizer.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
// // flutter run -d chrome --web-hostname localhost --web-port 5000
// class HomeScreenDesktop extends StatefulWidget {
//   @override
//   _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
// }
//
// class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
//   int selectedType;
//   bool sectionChange = true;
//   YoutubePlayerController _controller;
//   final controller = Get.put(MovieController());
//   final youController = Get.put(YoutubeController());
//   final ItemScrollController itemScrollController = ItemScrollController();
//   final ItemPositionsListener itemPositionsListener =
//   ItemPositionsListener.create();
//   var parsedData;
//   @override
//   void initState() {
//     YoutubePlayerController _controller;
//     final controller = Get.put(MovieController());
//     controller.getMovies(controller);
//     Future.delayed(Duration.zero, () async {
//       final data = await http.get(
//           'https://api.themoviedb.org/3/movie/popular?api_key=239073ac9013319bd7a0c03a2533b982&language=ko&page=1®ion=KR');
//       setState(() {
//         parsedData = jsonDecode(data.body)['results'];
//       });
//     });
//     controller.count.value = 0;
// // TODO
//
//     super.initState();
//     // List<Youtube> _youtubeLista =
//     // List<Youtube>.from(parsed.map((i) => Youtube.fromJson(i)));
//     // youController.youtubeList = _youtubeLista;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller.movieList.add(Movie(
//         image: parsedData[0]['poster_path'],
//         title: parsedData[0]['title'],
//         releaseDate: parsedData[0]['release_date'],
//         description: parsedData[0]['overview']));
//     controller.selectedTitle = controller.movieList[0].title;
//     Size sized = MediaQuery.of(context).size;
//     return LayoutBuilder(builder: (context, constraints) {
//       return OrientationBuilder(builder: (context, orientation) {
//         SizerUtil().init(constraints, orientation);
//         return Container(
//           width: double.infinity,
//           child: Stack(
//             children: [
//               //TODO Background box(left), image(right)
//               Row(
//                 children: [
//                   Container(
//                     width: 20.3.h,
//                     height: double.infinity,
//                     color: kSidebarColor,
//                   ),
//                   Expanded(
//                       child: Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                     'https://image.tmdb.org/t/p/original' +
//                                         controller.movieList[controller.count.value]
//                                             .image),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 gradient: LinearGradient(
//                                     begin: FractionalOffset.centerRight,
//                                     end: FractionalOffset.centerLeft,
//                                     colors: [
//                                       Color(0xFF1D1D1D).withOpacity(0.5),
//                                       Color(0xFF1D1D1D),
//                                     ],
//                                     stops: [
//                                       0.0,
//                                       1.0
//                                     ])),
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//               ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minWidth: 600,
//                   maxWidth: 600,
//                   minHeight: 550,
//                   maxHeight: double.infinity,
//                 ),
//                 child: Container(
//                   margin: EdgeInsets.only(left: 61, top: 73),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //TODO Left Side Movie Info
//                       sectionChange
//                           ? GroupButton(
//                         isRadio: true,
//                         selectedTextStyle: TextStyle(
//                           fontSize: 26,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         unselectedTextStyle: TextStyle(
//                             fontSize: 26, color: Color(0xFF616161)),
//                         selectedBorderColor: Colors.transparent,
//                         unselectedBorderColor: Colors.transparent,
//                         selectedColor: Colors.transparent,
//                         unselectedColor: Colors.transparent,
//                         spacing: 6,
//                         onSelected: (index, isSelected) {
//                           setState(() {
//                             controller.count.value = 0;
//                             selectedType = index;
//                           });
//                           itemScrollController.scrollTo(
//                               index: 0,
//                               duration: Duration(seconds: 1),
//                               curve: Curves.easeInOutCubic);
//                         },
//                         buttons: ['인기', '개발자 추천', 'TV시리즈'],
//                       )
//                           : GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             sectionChange = true;
//                           });
//                         },
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                       ),
//                       SizedBox(height: 64),
//                       // TODO Title & Information
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   color: Colors.red,
//                                   width: 100,
//                                   height: 50,
//                                 ),
//                               ),
//                               Text(
//                                 controller
//                                     .movieList[controller.count.value].title,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 28.0.sp),
//                                 maxLines: 1,
//                               ),
//                               SizedBox(height: 20),
//                               Row(
//                                 children: <Widget>[
//                                   Container(
//                                     height: 27,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         color: Color(0xFF6E6E6E),
//                                         borderRadius: BorderRadius.circular(3)),
//                                     child: Center(
//                                       child: GestureDetector(
//                                         onTap: () {},
//                                         child: Text(
//                                           '15세이상 관람가',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 14,
//                                   ),
//                                   Text(
//                                     controller.movieList[controller.count.value]
//                                         .releaseDate
//                                         .substring(0, 4),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 16),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: sized.height > 863 ? 24 : 0,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   print(MediaQuery.of(context).size.height);
//                                 },
//                                 child: sized.height > 863
//                                     ? Container(
//                                     width:
//                                     MediaQuery.of(context).size.width >
//                                         1100
//                                         ? 58.0.h
//                                         : 30.0.h,
//                                     height: 70,
//                                     child: SingleChildScrollView(
//                                       child: Text(
//                                         controller
//                                             .movieList[
//                                         controller.count.value]
//                                             .description,
//                                         style: TextStyle(
//                                             color: Colors.white
//                                                 .withOpacity(0.8),
//                                             letterSpacing: 1,
//                                             wordSpacing: 0.8,
//                                             height: 1.4),
//                                       ),
//                                     ))
//                                     : Container(),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               sectionChange
//                                   ? Container(
//                                 width: 58.0.w,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     //TODO 리뷰영상
//                                     Container(
//                                       width: 156,
//                                       height: 36,
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                         BorderRadius.circular(3),
//                                         color: Color(0xFFFFE24B),
//                                       ),
//                                       child: Center(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               FontAwesomeIcons.youtube,
//                                               size: 18,
//                                             ),
//                                             SizedBox(width: 5),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 setState(() {
//                                                   sectionChange = false;
//                                                 });
//                                               },
//                                               child: Text(
//                                                 'Youtube 리뷰 영상',
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                     FontWeight.w700),
//                                               ),
//                                             ),
//                                             SizedBox(width: 6),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           width: 86,
//                                           height: 36,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 0.5,
//                                                 color: Colors.white),
//                                             borderRadius:
//                                             BorderRadius.circular(3),
//                                             color: Colors.transparent,
//                                           ),
//                                           child: Center(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .center,
//                                               children: [
//                                                 Icon(
//                                                   Icons
//                                                       .play_circle_outline,
//                                                   color: Colors.white,
//                                                   size: 18,
//                                                 ),
//                                                 SizedBox(width: 5),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     print('hi');
//                                                   },
//                                                   child: Text(
//                                                     '예고편',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w500,
//                                                         color:
//                                                         Colors.white),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 10),
//                                         Container(
//                                           width: 136,
//                                           height: 36,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 0.5,
//                                                 color: Colors.white),
//                                             borderRadius:
//                                             BorderRadius.circular(3),
//                                             color: Colors.transparent,
//                                           ),
//                                           child: Center(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .center,
//                                               children: [
//                                                 Icon(
//                                                   Icons
//                                                       .play_circle_outline,
//                                                   color: Colors.white,
//                                                   size: 18,
//                                                 ),
//                                                 SizedBox(width: 5),
//                                                 GestureDetector(
//                                                   onTap: () {},
//                                                   child: Text(
//                                                     '관심목록에 추가',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .w500,
//                                                         color:
//                                                         Colors.white),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                               //TODO ALL about textform field & all about cast
//                                   : Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       print(MediaQuery.of(context)
//                                           .size
//                                           .width);
//                                     },
//                                     child: Text(
//                                       '출연진',
//                                       style: TextStyle(
//                                         fontSize: 30,
//                                         color:
//                                         Colors.white.withOpacity(0.8),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 20),
//                                   Container(
//                                     width: MediaQuery.of(context)
//                                         .size
//                                         .width >
//                                         1100
//                                         ? 58.0.h
//                                         : 30.0.h,
//                                     height: 200,
//                                     child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount:
//                                       controller.movieList.length,
//                                       itemBuilder: (BuildContext context,
//                                           int index) {
//                                         return Container(
//                                           padding:
//                                           EdgeInsets.only(right: 10),
//                                           child: Column(
//                                             children: [
//                                               CircleAvatar(
//                                                 radius: 13.0.sp,
//                                                 backgroundImage: controller
//                                                     .peopleList[
//                                                 index]
//                                                     .profileImage ==
//                                                     null
//                                                     ? NetworkImage(
//                                                     'https://firebasestorage.googleapis.com/v0/b/movie-web-f970c.appspot.com/o/movies%2Fnoneprofile.png?alt=media&token=a5d38773-adc3-4580-87fd-244f246a97ba')
//                                                     : NetworkImage(
//                                                     'https://image.tmdb.org/t/p/original/' +
//                                                         controller
//                                                             .peopleList[
//                                                         index]
//                                                             .profileImage),
//                                               ),
//                                               SizedBox(height: 6),
//                                               Text(
//                                                 controller
//                                                     .peopleList[index]
//                                                     .name,
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Colors.white),
//                                               )
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               //TODO
//               sectionChange
//                   ? Positioned(
//                 left: 61,
//                 bottom: 0,
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 40),
//                   width: MediaQuery.of(context).size.width,
//                   height: 345,
//                   child: ScrollablePositionedList.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemScrollController: itemScrollController,
//                       itemPositionsListener: itemPositionsListener,
//                       itemCount: controller.movieList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {});
//                             controller.count.value = index;
//                             itemScrollController.scrollTo(
//                                 index: controller.count.value,
//                                 duration: Duration(seconds: 1),
//                                 curve: Curves.easeInOutCubic);
//                             // youtube detial
//                             controller.selectedTitle = controller
//                                 .movieList[controller.count.value ?? 0]
//                                 .title;
//                             // Road Youtube Api
//                             Future.delayed(Duration.zero, () async {
//                               controller.selectedTitle = controller
//                                   .movieList[controller.count.value]
//                                   .title;
//                               final data = await http.get(
//                                   'https://www.googleapis.com/youtube/v3/search?part=snippet&maxRsults=5&q=${controller.selectedTitle}영화리뷰&type=video&key=AIzaSyBcPV1IoW00mYug7BQLX0o7XC0nkdmzHv4');
//                               var parsed = jsonDecode(data.body)['items'];
//                               List<Youtube> _youtubeLista =
//                               List<Youtube>.from(parsed
//                                   .map((i) => Youtube.fromJson(i)));
//                               youController.youtubeList = _youtubeLista;
//                             });
//                             // Road Movie cast (People)
//                             controller.movieId = controller
//                                 .movieList[controller.count.value].id;
//                             Future.delayed(Duration.zero, () async {
//                               final data = await http.get(
//                                 'https://api.themoviedb.org/3/movie/${controller.movieId}/credits?api_key=239073ac9013319bd7a0c03a2533b982&language=ko&page=1%C2%AEion=KR',
//                               );
//                               // final result = jsonDecode(data.body);
//                               var parsed = jsonDecode(data.body)['cast'];
//                               List<People> _peopleLista =
//                               List<People>.from(parsed
//                                   .map((i) => People.fromJson(i)));
//                               controller.peopleList = _peopleLista;
//                             });
//                           },
//                           // onDoubleTap: () {
//                           //   print(controller.selectedId);
//                           //   setState(() {
//                           //     sectionChange = false;
//                           //   });
//                           //   controller.count.value = index;
//                           //   itemScrollController.scrollTo(
//                           //       index: controller.count.value,
//                           //       duration: Duration(seconds: 1),
//                           //       curve: Curves.easeInOutCubic);
//                           //   // youtube detial
//                           //   controller.selectedTitle = controller
//                           //       .movieList[controller.count.value ?? 0]
//                           //       .title;
//                           // },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 20),
//                             width: 236,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Image.network(
//                                   'https://image.tmdb.org/t/p/original/' +
//                                       controller.movieList[index].image),
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               )
//               //TODO |||| SECTION CHANGE TO DETAIL SCREEN |||
//                   : YoutubeReviewVideo(context)
//             ],
//           ),
//         );
//       });
//     });
//   }
//
//   // TODO SectionChange (From Youtube API with review wheel)
//   Positioned YoutubeReviewVideo(BuildContext context) {
//     return Positioned(
//       right: 0,
//       child: Container(
//           margin: EdgeInsets.only(bottom: 40),
//           width: MediaQuery.of(context).size.width * 0.5,
//           height: MediaQuery.of(context).size.height,
//           child: ListWheelScrollView.useDelegate(
//             itemExtent: 400,
//             diameterRatio: 6,
//             childDelegate: ListWheelChildBuilderDelegate(
//                 builder: (BuildContext context, int index) {
//                   if (index < 0 || index > 2) {
//                     return null;
//                   }
//                   _controller = YoutubePlayerController(
//                     initialVideoId: youController.youtubeList[index].videoId,
//                     // controller.youtubeList[index].videoId,
//                     params: YoutubePlayerParams(
//                       // Defining custom playlist
//                       startAt: Duration(seconds: 1),
//                       showControls: true,
//                       showFullscreenButton: true,
//                     ),
//                   );
//
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 40),
//                     width: 500,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         YoutubePlayerControllerProvider(
//                           // Provides controller to all the widget below it.
//                           controller: _controller,
//                           child: YoutubePlayerIFrame(
//                             aspectRatio: 16 / 9,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         // Column(
//                         //   mainAxisAlignment:
//                         //       MainAxisAlignment.spaceBetween,
//                         //   children: [
//                         //     Text(
//                         //       youController.youtubeList[index].title,
//                         //       overflow: TextOverflow.fade,
//                         //       softWrap: true,
//                         //       style: TextStyle(
//                         //           fontSize: 22, color: Colors.white),
//                         //     ),
//                         //     Row(
//                         //       children: [
//                         //         Icon(
//                         //           Icons.thumb_up_alt_outlined,
//                         //           color: Colors.white,
//                         //         ),
//                         //         SizedBox(
//                         //           width: 6,
//                         //         ),
//                         //         Text(
//                         //           '263',
//                         //           style: TextStyle(color: Colors.white),
//                         //         ),
//                         //         SizedBox(
//                         //           width: 20,
//                         //         ),
//                         //         Icon(
//                         //           Icons.thumb_down_alt_outlined,
//                         //           color: Colors.white,
//                         //         ),
//                         //         SizedBox(
//                         //           width: 6,
//                         //         ),
//                         //         Text(
//                         //           '12',
//                         //           style: TextStyle(color: Colors.white),
//                         //         ),
//                         //       ],
//                         //     ),
//                         //   ],
//                         // )
//                       ],
//                     ),
//                   );
//                 }),
//           )),
//     );
//   }
// }

// controller.movieList.add(Movie(
// image: parsedData[0]['poster_path'],
// title: parsedData[0]['title'],
// releaseDate: parsedData[0]['release_date'],
// description: parsedData[0]['overview']));
