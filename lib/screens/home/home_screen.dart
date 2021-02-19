import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/movie_controller.dart';
import 'package:moview_web/model/movie_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';
import 'home_screen_tablet.dart';

class HomeScreen extends StatelessWidget {
  static final String id = '/home';
  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    final controller = Get.put(MovieController());
    controller.getMovies(controller);

    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return HomeScreenMobile();
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
            return Center(
              child: Text('가로모드에 최적화 되어 있는 웹 페이지 입니다'),
            );
          } else {
            return HomeScreenDesktop();
          }
        }
      },
    );
  }
}
