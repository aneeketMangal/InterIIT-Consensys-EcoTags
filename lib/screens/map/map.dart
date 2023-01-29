import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'maputils.dart';

class MapWidget extends StatefulWidget {
  // list of map markers
  final List<MapObject> mapObjects;
  MapWidget({
    Key? key,
    required this.mapObjects,
  }) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  get mapObjects => widget.mapObjects;

  Marker _mapObjectToMarker(MapObject mapObject) {
    return Marker(
        markerId: MarkerId(mapObject.title),
        position: LatLng(mapObject.latitude, mapObject.longitude),
        icon: getIconForMapObject(mapObject.mapObjectType),
        infoWindow:
            InfoWindow(title: mapObject.title, snippet: mapObject.details));
  }

  Set<Marker> _getMapMarkers() {
    Set<Marker> markers = Set();
    // iterate over map objects
    mapObjects.forEach((mapObject) {
      // add marker to markers
      markers.add(_mapObjectToMarker(mapObject));
    });
    return markers;
    // return mapObjects.map((mapObject) => _mapObjectToMarker(mapObject)).toSet();
  }

  // restrict only to india
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 5,
  );

  // take marker as class variable

  @override
  Widget build(BuildContext context) {
    print(
        'map objects: ${mapObjects.map((mapObject) => mapObject.title).toList()}');
    return MaterialApp(
      home: Scaffold(
          // image in app bar

          body: Stack(
        children: <Widget>[
          // remove buttons
          GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: _cameraPosition,
              markers: _getMapMarkers())
        ],
      )),
    );
  }
}

// Widget hamburgerMenu(context) {
//   return IconButton(
//     icon: const Icon(Icons.menu),
//     onPressed: () {
//       // pop a hamburger menu
//       Scaffold.of(context).openDrawer(
//         child: ListView(
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Drawer Header'),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
