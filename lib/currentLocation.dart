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
  final List<Marker> markers = [  ];

  loadCurrentLocationData(){
    getUserCurrentLocation().then((value) async {
      final GoogleMapController controller = await gMapController.future;
      LatLng latlng = LatLng(value.latitude, value.longitude);
      markers.add(Marker(markerId: const MarkerId('1'), position: latlng));
      CameraPosition cameraPosition =
      CameraPosition(zoom: 17.99, target: latlng);
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
    setState(() {});
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) => {})
        .onError((error, stackTrace) => {});
    return await Geolocator.getCurrentPosition();
  }

  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(20.5937, 78.9629), zoom: 5);

  @override
  void initState() {
    super.initState();
    loadCurrentLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.hybrid,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            gMapController.complete(controller);
          },
          markers: Set<Marker>.of(markers),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            loadCurrentLocationData();
          },
          child: const Icon(Icons.my_location),
        ),
      ),
    );
  }
}
