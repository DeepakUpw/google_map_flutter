
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

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
                var coordinates = Coordinates(27.7304, 75.4753);
                var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                String addressLine = address.first.addressLine.toString();
                print("Location => $addressLine ");
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


