
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_map_flutter/routes/routes_name.dart';
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
        )),
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
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                mapController.complete(controller);
              },
              markers: Set.of(markers),
            ),
            Positioned(
              left: 10,
              top: 10,
              right: 10,
              height: 40,
              child: Container(
                color: Colors.white,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.firstScreen);
                      },
                      child: Center(
                          child: Text("Screen 1")
                      ),
                    ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              right: 10,
              height: 40,
              child: Container(
                color: Colors.white,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.currentLocation);
                      },
                      child: Center(
                          child: Text("current location")
                      ),
                    ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
