// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/Loc_Model.dart';
import 'Map_screen.dart';

class Api_page extends StatefulWidget {
  const Api_page({Key? key}) : super(key: key);

  @override
  State<Api_page> createState() => _Api_pageState();
}

class _Api_pageState extends State<Api_page> {
  String name = "";

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
        appBar: AppBar(
            title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        )),
        body: FutureBuilder(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(

                  itemBuilder: (context, index) {

                    var data = (snapshot.data as List<Loc_Model>)[index];

                    if (name.isEmpty) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Map_Screen()),
                          );
                        },
                        title: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data.place,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    if (data.name
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return ListTile(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Map_Screen()),
                          );

                        },
                        title: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data.place,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return Container();
                  },
                  itemCount:  (snapshot.data as List<Loc_Model>).length,);
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


