import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api_files/new_model.dart';
import 'package:social_media/utils/routes.dart';

class verifyotp extends StatefulWidget {
  const verifyotp({super.key});

  @override
  State<verifyotp> createState() => _verifyotpState();
}

var printotp;

class _verifyotpState extends State<verifyotp> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController verifyController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController useridController = TextEditingController();

  UserId? userData;
  Future OTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var headers = {
      'Cookie': 'ci_session=915d1457fcdb8a4442703b44804b23cfa4adec94'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://developmentalphawizz.com/social_media/api/u_verify_otp'));
    request.fields.addAll({
      'mobile': mobileController.text.toString(),
      'otp': verifyController.text.toString()
    });
    print("this is verify otp request ${request.fields.toString()}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var Response = await response.stream.bytesToString();
      final finalResponse = json.decode(Response);
      var result = GetUser.fromJson(finalResponse);

      userData = result.userId!;

      var fname = result.userId?.fName;
      var lname = result.userId?.lName;
      var mobile = result.userId?.mobile;
      var gender = result.userId?.gender;
      var dob = result.userId?.dob;
      var id = result.userId?.id;

      prefs.setString('first_name', fname!);
      prefs.setString('last_name', lname!);
      prefs.setString('mobile_no', mobile!);
      prefs.setString('_gender', gender!);
      prefs.setString('_dob', dob!);
      prefs.setString('user_id', id!);

      print("this is my first name======>${fname}");
      print("this is response${finalResponse}");
      print("User id--------------->${id}");
    } else {
      print(response.reasonPhrase);
    }
  }

  //============================ setpreference ===================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getName();
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    printotp = prefs.getInt('otp');
    String? mobileNo = prefs.getString('mobile_no');
    if (mobileNo != null && mobileNo.isNotEmpty) {
      mobileController.text = mobileNo;
    }

    setState(() {});
  }
  //=====================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify otp'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Verify otp',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileController,
                  decoration: InputDecoration(hintText: "${mobileController}"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  controller: verifyController,
                  decoration: InputDecoration(hintText: "${printotp}"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      OTP().then((value) =>
                          Navigator.pushNamed(context, MyRoutes.user_get));
                    },
                    child: Text('Verify')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
