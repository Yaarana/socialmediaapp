import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/utils/routes.dart';

class sendotp extends StatefulWidget {
  const sendotp({super.key});

  @override
  State<sendotp> createState() => _sendotpState();
}

class _sendotpState extends State<sendotp> {
  TextEditingController mobileController = TextEditingController();

  Future OTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var LINK = "https://developmentalphawizz.com/social_media/api/send_otp";

    Map mdata = {
      'mobile': mobileController.text.toString(),
    };
    try {
      http.Response response = await http.post(Uri.parse(LINK), body: mdata);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var sendotp = data['otp'];

        prefs.setInt('otp', sendotp);

        print(mdata);

        print(sendotp);
        print("--------------> ${sendotp}");

        return sendotp;
      } else {
        print("wrong Credential");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send otp'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Send otp',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'enter your mobile',
                      contentPadding: EdgeInsets.all(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      OTP().then((value) =>
                          Navigator.pushNamed(context, MyRoutes.verify));
                    },
                    child: Text('Send Otp')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
