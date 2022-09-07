import 'package:flutter/material.dart';
import 'package:google_map_flutter/routes/routes_name.dart';
import 'package:google_map_flutter/screen%201.dart';

import '../Map.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.firstScreen:
        {
          return MaterialPageRoute(builder: (context) => FirstScreen());
        }
      case RoutesName.mapHome:
        {
          return MaterialPageRoute(builder: (context) => MyMap());
        }
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('No Routes Screen Available'),
              ),
            );
          },
        );
    }
  }
}
