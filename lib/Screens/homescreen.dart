import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'api_called_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var loctionmsg ="";

  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }


    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    var lat = position.latitude;
    var long = position.longitude;

    setState(() {
      loctionmsg = "Longitude : $long \n Latitude : $lat ";
    });

    return await Geolocator.getCurrentPosition();
  }


  @override
  void initState() {
    determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Api_page(),
              ),
            );
          }, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              determinePosition();
            }, child: Text("Get Current Location")),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CORDINATES",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                )),
                Text(" ="),
                Text(" $loctionmsg",style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
