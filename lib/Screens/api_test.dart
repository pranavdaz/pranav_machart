import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/Loc_Model.dart';

class Api_test extends StatefulWidget {
  const Api_test({Key? key}) : super(key: key);

  @override
  State<Api_test> createState() => _Api_testState();
}

class _Api_testState extends State<Api_test> {

  late Future<List<Loc_Model>> listUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listUsers = fetchUsers();
  }

  Future<List<Loc_Model>> fetchUsers() async {
    final response =
    await http.get(Uri.parse('http://machart.in/api/list.php?lat=LATITUDE&lon=LONGITUDE'));
    if (response.statusCode == 200) {
      var getUsersData = json.decode(response.body) as List;
      var listUsers = getUsersData.map((i) => Loc_Model.fromJson(i)).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Loc_Model>>(
        future: listUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  var todo = (snapshot.data as List<Loc_Model>)[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          todo.place.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: (snapshot.data as List<Loc_Model>).length);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyanAccent,
            ),
          );
        },
      ));

  }
}
