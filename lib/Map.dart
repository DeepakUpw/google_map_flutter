import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {

  Completer<GoogleMapController> mapController = Completer();

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(27.7304, 75.4753),
    zoom: 14.56,
  );

  List<Marker> markers = [];
  List<Marker> list = [
    const Marker(
      markerId: MarkerId('1'),
      draggable: true,
      position: LatLng(27.7304, 75.4753),

    ),
    const Marker(
      markerId: MarkerId('1'),
      draggable: true,
      position: LatLng(27.73804, 75.47453),

    ),
    const Marker(
        markerId: MarkerId('1'),
        draggable: true,
        position: LatLng(27.73904, 75.47853),
        infoWindow: InfoWindow(
          title: 'Udaipurwati',
        )
    ),
  ];

  @override
  void initState() {
    super.initState();

    markers.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            mapController.complete(controller);
          },
          markers: Set.of(markers),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          GoogleMapController controller = await mapController.future;
          controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(27.73808, 75.47452),
                  zoom: 16.56,
                  bearing: 2
                )
              ));
        },
        splashColor: Colors.red,
        child: Icon(Icons.my_location),
      ),

    );
  }
}
