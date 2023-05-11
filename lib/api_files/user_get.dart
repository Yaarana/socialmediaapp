import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:social_media/bottom_ui/bottom_home.dart';
import 'package:social_media/bottom_ui/group.dart';
import 'package:social_media/bottom_ui/location.dart';
import 'package:social_media/bottom_ui/profile.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  List pages = [
    bottomHome(),
    location(),
    group(),
    profile(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // int _page = 3;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.black)),
        child: CurvedNavigationBar(
          onTap: onTap,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.location_on, size: 30),
            Icon(Icons.group, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.grey.withOpacity(0.6),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
