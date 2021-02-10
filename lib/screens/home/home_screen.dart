import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_screen_desktop.dart';
import 'home_screen_mobile.dart';
import 'home_screen_tablet.dart';

class HomeScreen extends StatelessWidget {
  static final String id = '/home';
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (size.isMobile) {
          return HomeScreenMobile();
        }
        if (size.isTablet) {
          return HomeScreenTablet();
        }
        return HomeScreenDesktop();
      },
    );
  }
}
