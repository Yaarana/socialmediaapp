import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/utils/routes.dart';
import 'package:social_media/utils/routes.dart';

class bottomHome extends StatefulWidget {
  const bottomHome({super.key});

  @override
  State<bottomHome> createState() => _bottomHomeState();
}

var result;
var lname;

class _bottomHomeState extends State<bottomHome> {
//==================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getName();
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    result = prefs.getString('first_name');
    lname = prefs.getString('last_name');
    setState(() {});
  }

  //=======================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/new.png'),
                  ),
                  Text(
                    "${result} ${lname}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black87,
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black87,
              leading: Icon(Icons.location_on),
              title: Text('location'),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black87,
              leading: Icon(Icons.group),
              title: Text('Group'),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black87,
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black87,
              leading: Icon(Icons.logout),
              title: Text('logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, MyRoutes.send);
              },
            ),
          ],
        ),
      ),
    );
  }
}
