
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {

  final Completer<GoogleMapController> gMapController = Completer();

  Future<Position> getUserCurrentLocation() async{

    await Geolocator.requestPermission().then((value) => {

    }).onError((error, stackTrace) => {

    });
    return await Geolocator.getCurrentPosition();

  }

  CameraPosition initialCameraPosition = const CameraPosition(
    target:  LatLng(20.5937, 78.9629),
    zoom: 5
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.hybrid,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller){
            gMapController.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getUserCurrentLocation().then((value) => {
              print("My Location ${value.latitude} ${value.longitude}")
            });
          },
          child: const Icon(Icons.my_location),

        ),

      ),
    );
  }

}
