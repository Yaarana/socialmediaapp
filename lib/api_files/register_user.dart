import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  //==============================================================
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  Future Reg() async {
    var LINK =
        'https://developmentalphawizz.com/social_media/api/user_registration';

    Map mdata = {
      'first_name': fnameController.text.toString(),
      'last_name': lnameController.text.toString(),
      'mobile': mobileController.text.toString(),
      'email': emailController.text.toString(),
      'gender': genderController.text.toString(),
      'dob': dobController.text.toString(),
    };
    print("json data : ${mdata}");

    try {
      http.Response response = await http.post(Uri.parse(LINK), body: mdata);
      var data = jsonDecode(response.body.toString());
      print("Data ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  //============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register user using api'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: fnameController,
                    decoration: InputDecoration(
                      hintText: 'first name',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: lnameController,
                  decoration: InputDecoration(
                    hintText: 'last name',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileController,
                  decoration: InputDecoration(
                    hintText: 'mobile',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'email address',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                    hintText: 'gender',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: dobController,
                  decoration: InputDecoration(
                      suffixIcon:
                          Icon(Icons.calendar_today), //icon of text field
                      labelText: "DOB" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dobController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Reg().then((value) =>
                          Navigator.pushNamed(context, MyRoutes.send));
                    },
                    child: Text('Register')),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.send);
                },
                child: Text('Already have an account, Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
