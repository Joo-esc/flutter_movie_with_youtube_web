import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/movie_controller.dart';
import 'package:moview_web/model/movie_model.dart';
import 'package:moview_web/utill/default.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';
import 'home_screen_tablet.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static final String id = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    var parsedData;
    final controller = Get.put(MovieController());
    controller.getMovies(controller);
    String initialTitle;
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  onTap: _onItemTap,
                  backgroundColor: kSidebarColor,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  unselectedItemColor: Color(0xFF616161),
                  selectedItemColor: kSideBarActiveIconColor,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.credit_card_sharp), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: 'Account'),
                  ]),
              body: HomeScreenMobile());
        }
        if (size.isTablet) {
          if (sized.width < sized.height) {
            return Center(
              child: Text('가로모드에 최적화 되어 있는 웹 페이지 입니다'),
            );
          } else {
            return HomeScreenTablet();
          }
        } else {
          if (sized.width < sized.height) {
            return Container(
              color: kSidebarColor,
              child: Center(
                child: Text(
                  '가로모드에 최적화 되어 있는 웹 페이지 입니다',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            return HomeScreenDesktop();
          }
        }
      },
    );
  }
}
