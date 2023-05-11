import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/api_files/group_model.dart';
// import 'package:socialmediaapp/Models/group_model.dart';

// import 'Group.dart';
// import 'Groups/insta.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<Data> group = [];

  getData() async {
    final response = await http.get(Uri.parse(
        "https://developmentalphawizz.com/social_media/api/get_groups_list"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      var result = groupmodel.fromJson(data);
      setState(() {
        group = result.data!;
        print("${group}");
      });

      return group;
    } else {
      return group;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: Container(
          color: Colors.white70,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: group.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${group[index].name}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                  "Joined users:${group[index].totalUser}"),
                                              SizedBox(height: 5),
                                              Text(
                                                  "Zipcodes:${group[index].pincode}"),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ));
  }
}
