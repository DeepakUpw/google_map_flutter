
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  String setAddress = "Address";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(setAddress),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async{
                // Passed the coordinates of latitude and longitude
                List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
                String addressLine = placemarks.first.street.toString();
                print("Location => $addressLine");
                setState(() {
                  setAddress = addressLine;
                });
              },
              child: Container(
                height: 40 ,
                color: Colors.blue,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text('Show Address'),
              ),

            ),
          )
        ],
      ),
    ),
    );
  }
}


