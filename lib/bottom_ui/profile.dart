import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api_files/user_get.dart';
import 'package:social_media/bottom_ui/bottom_home.dart';
import 'package:social_media/utils/routes.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

var result;
var lname;

class _profileState extends State<profile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   width: 10,
                  // ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/new.png'),
                  ),
                  Text("${result} ${lname}"),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(35)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.editnew);
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(color: Colors.red, thickness: 1.0),
          ],
        ),
      ),
    );
  }
}
