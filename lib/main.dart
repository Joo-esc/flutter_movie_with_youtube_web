import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moview_web/screens/home/home_screen.dart';
import 'package:moview_web/screens/home/home_screen_desktop.dart';
import 'package:moview_web/screens/mypage/mypage_screen.dart';
import 'package:moview_web/utill/default.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/services.dart';
import 'screens/login/login_main_screen.dart';

// flutter run -d chrome --web-hostname localhost --web-port 5000
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/LoginMain', page: () => LoginMain()),
        GetPage(name: '/HomeScreen', page: () => HomeScreen()),
        GetPage(name: '/HomeScreenDesktop', page: () => HomeScreenDesktop()),
        GetPage(name: '/MyProfile', page: () => MyPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Sub Project',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      //TODO After login screen use MainScreen
      home: LoginMain(),

      // initialRoute: '/',
    );
  }
}

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  static final String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex;
  PageController _pageController;
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedIndex = 0;
    _pageController =
        PageController(initialPage: _selectedIndex, keepPage: true);
    //GetX Set URL Routes

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void route() {
    Get.toNamed('MyScreen');
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      return Scaffold(
        backgroundColor: kSidebarColor,
        key: _scaffoldKey,
        appBar: size.isMobile
            ? AppBar(
                backgroundColor: kSidebarColor,
                elevation: 0,
                centerTitle: false,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.youtube,
                      size: 30,
                      color: kSideBarActiveIconColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Movie',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          )),
                    ])),
                  ],
                ),
              )
            // AppBar(
            //         elevation: 0,
            //         actions: [
            //           Padding(
            //             padding: const EdgeInsets.all(16),
            //             child: Icon(Icons.search, color: Color(0xFF616161)),
            //           ),
            //         ],
            //         backgroundColor: kSidebarColor,
            //       )
            : PreferredSize(
                preferredSize: Size(00, 0),
                child: Container(),
              ),
        //TODO DRAWER KEEP
        // drawer: size.isMobile
        //     ? SizedBox(
        //         width: 400,
        //         child: Drawer(
        //           child: Padding(
        //             padding: EdgeInsets.only(top: 1000, bottom: 200),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 GestureDetector(
        //                   onTap: () {
        //                     setState(() {
        //                       _selectedIndex = 0;
        //                       _pageController.jumpToPage(0);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   child: CircleAvatar(
        //                     radius: 25,
        //                     child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(30),
        //                         child: Image.asset(
        //                           'assets/images/logo_black.png',
        //                           width: double.infinity,
        //                           height: double.infinity,
        //                           fit: BoxFit.fitHeight,
        //                         )),
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _selectedIndex = 1;
        //                       _pageController.jumpToPage(1);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   icon: Icon(
        //                     Icons.design_services_rounded,
        //                     color: _selectedIndex == 1
        //                         ? Colors.redAccent
        //                         : Colors.grey,
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _selectedIndex = 2;
        //                       _pageController.jumpToPage(2);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   icon: Icon(
        //                     Icons.search,
        //                     color: _selectedIndex == 2
        //                         ? Colors.orange
        //                         : Colors.grey,
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _selectedIndex = 3;
        //                       _pageController.jumpToPage(3);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   icon: Icon(
        //                     Icons.star,
        //                     color: _selectedIndex == 3
        //                         ? Colors.amber
        //                         : Colors.grey,
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _selectedIndex = 4;
        //                       _pageController.jumpToPage(4);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   icon: Icon(
        //                     Icons.person,
        //                     color: _selectedIndex == 4
        //                         ? Colors.green
        //                         : Colors.grey,
        //                   ),
        //                 ),
        //                 IconButton(
        //                   onPressed: () {
        //                     setState(() {
        //                       _selectedIndex = 5;
        //                       _pageController.jumpToPage(5);
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                   icon: Icon(
        //                     Icons.bookmark,
        //                     color: _selectedIndex == 5
        //                         ? Colors.indigoAccent
        //                         : Colors.grey,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ))
        //     : Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.red,
        //       ),
        body: Row(
          children: <Widget>[
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: size.isMobile
                    ? Container()
                    : IntrinsicHeight(
                        child: NavigationRail(
                          // elevation: 0.99,
                          groupAlignment: 0,
                          backgroundColor: kSidebarColor,
                          selectedIndex: _selectedIndex,
                          onDestinationSelected: (int index) {
                            setState(() {
                              _selectedIndex = index;
                              _pageController.jumpToPage(_selectedIndex);
                            });
                          },
                          labelType: NavigationRailLabelType.selected,
                          destinations: [
                            NavigationRailDestination(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.home_outlined,
                                  color: kSideBarIconColor,
                                  size: 23,
                                ),
                              ),
                              selectedIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.home_outlined,
                                  size: 23,
                                  color: kSideBarActiveIconColor,
                                ),
                              ),
                              label: Text(
                                '',
                                style: TextStyle(color: kSideBarIconColor),
                              ),
                            ),
                            NavigationRailDestination(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.search,
                                  color: kSideBarIconColor,
                                  size: 23,
                                ),
                              ),
                              selectedIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.search,
                                  color: kSideBarActiveIconColor,
                                  size: 23,
                                ),
                              ),
                              label: Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            NavigationRailDestination(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.credit_card_sharp,
                                  size: 23,
                                  color: kSideBarIconColor,
                                ),
                              ),
                              selectedIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(Icons.credit_card_sharp,
                                    size: 23, color: kSideBarActiveIconColor),
                              ),
                              label: Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            NavigationRailDestination(
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(
                                  Icons.person,
                                  size: 23,
                                  color: kSideBarIconColor,
                                ),
                              ),
                              selectedIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 45),
                                child: Icon(Icons.person,
                                    size: 23, color: kSideBarActiveIconColor),
                              ),
                              label: Text(
                                '',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            // VerticalDivider(thickness: 0, width: 0),
            // This is the main content.
            Expanded(
                child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                HomeScreen(),
                Scaffold(
                  body: Container(
                    color: Colors.orange,
                  ),
                ),
                Scaffold(
                  body: Container(
                    color: Colors.amber,
                  ),
                ),
                MyPage(),
                // Get.toNamed('MyPage'),
              ],
            ))
          ],
        ),
      );
    });
  }
}
