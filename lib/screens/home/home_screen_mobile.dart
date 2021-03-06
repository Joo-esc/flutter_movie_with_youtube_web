import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/youtube_controller.dart';
import 'package:moview_web/utill/default.dart';
import 'package:provider/provider.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSidebarColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO 개발자 추천 영화 Section 1
          SizedBox(
            height: 12,
          ),
          Text(
            '개발자 추천',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 184,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/movie-web-f970c.appspot.com/o/movies%2Fmoviepost4.jpg?alt=media&token=72609078-4921-47ec-93cb-2adefa2d3905',
                    height: 220,
                    width: 146,
                  ),
                );
                Container(
                  margin: EdgeInsets.only(right: 12),
                  height: 220,
                  width: 146,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Center(
                    child: Text('$index'),
                  ),
                );
              },
            ),
          ), // ListView
        ],
      ),
    );
  }
}
