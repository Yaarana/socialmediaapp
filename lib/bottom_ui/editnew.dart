import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api_files/new_model.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController aboutmeController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  // TextEditingController useridController = TextEditingController();

  var firstname;
  var lastname;
  var gender;
  var mobileno;
  var dob;
  var userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getName();
    setState(() {});
  }

  //============================================================
  // Future<GetUser> fetchUserData() async {
  //   final response = await http.get(Uri.parse(
  //       'https://developmentalphawizz.com/social_media/api/get_user_data'));

  //   if (response.statusCode == 200) {
  //     return GetUser.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to fetch user data');
  //   }
  // }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    firstname = prefs.getString('first_name');

    lastname = prefs.getString('last_name');
    gender = prefs.getString('_gender');
    mobileno = prefs.getString('mobile_no');
    dob = prefs.getString('_dob');
    userid = prefs.getString('user_id');

    fnameController = TextEditingController(text: firstname);
    lnameController = TextEditingController(text: lastname);
    genderController = TextEditingController(text: gender);
    mobileController = TextEditingController(text: mobileno);
    dobController = TextEditingController(text: dob);

    print("------------------> ${firstname}");
  }

  //===========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white60,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/new.png'),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          //========================
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'First Name',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: fnameController,
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //===========================
                          //========================
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Last Name',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: lnameController,
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //===========================
                          //========================
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Contact No,',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: mobileController,
                            decoration: InputDecoration(
                                hintText: 'Contact No,',
                                border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //===========================
                          //========================

                          //========================
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: genderController,
                            decoration: InputDecoration(
                                hintText: 'Gender', border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //===========================
                          //========================
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Dob',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: dobController,
                            decoration: InputDecoration(
                                hintText: 'Dob', border: InputBorder.none),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Update'),
                          ),
                          //===========================
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
