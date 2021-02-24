import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moview_web/screens/mypage/mypage_screen_mobile.dart';
import 'package:moview_web/screens/mypage/mypage_screen_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mypage_screen_desktop.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return MyPageMobile();
        }
        if (size.isTablet) {
          if (sized.width < sized.height) {
            return Center(
              child: Text('가로모드에 최적화 되어 있는 웹 페이지 입니다'),
            );
          } else {
            return MyPageTablet();
          }
        } else {
          if (sized.width < sized.height) {
            return Center(
              child: Text(
                '가로모드에 최적화 되어 있는 웹 페이지 입니다',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return MyPageDesktop();
          }
        }
      },
    );
  }
}
