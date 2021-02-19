import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/youtube_controller.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

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
    return Center(
      child: ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        trimLines: 20,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
