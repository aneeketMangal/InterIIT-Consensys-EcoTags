import 'package:camera/camera.dart';
import 'package:ecotags/screens/camera.dart';
import 'package:ecotags/screens/map/hamburger.dart';
import 'package:ecotags/screens/map/map.dart';
import 'package:ecotags/screens/map/maputils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'bottomnav.dart';
import 'home/climateparametersviewer.dart';
import 'home/pointsviewer.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'login-page';
  final CameraDescription camera;
  const HomeScreen({
    super.key,
    required this.camera,
  });
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  int _currIndex = 2;
  String _name = 'World';
  List<MapObject> _mapObjects = [
    MapObject(
      id: '1',
      mapObjectType: MapObjectTypes.currUserPosition,
      latitude: 0.0,
      longitude: 0.0,
      title: 'Test',
      details: 'Test',
    ),
  ];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // define a funciton to convert MapObject to Marker

  @override
  void initState() {
    super.initState();
    // _getName();
    _getMapObjects();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: add bottom nav
    return Scaffold(
        key: _scaffoldState,
        drawer: const HamburgerMenu(),
        bottomNavigationBar: buildBottomNav(
          (index) {
            setState(() {
              _currIndex = index;
            });
          },
        ),
        body: Stack(children: <Widget>[
          if (_currIndex == 0) ...[
            Center(child: Text('Search'))
          ] else if (_currIndex == 1) ...[
            CameraWidget(camera: widget.camera)
          ] else if (_currIndex == 2) ...[
            MapWidget(mapObjects: _mapObjects)
          ] else if (_currIndex == 3) ...[
            Center(child: Text('Profile'))
          ],
          if (_currIndex == 2) ...[
            Positioned(
                left: 10,
                top: 40,
                child: Container(
                  width: 45,
                  height: 45,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  // put child at center

                  child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.menu),
                      // onPressed: () => Scaffold.of(context).openDrawer()),
                      onPressed: () =>
                          _scaffoldState.currentState!.openDrawer()),
                )),
            Positioned(bottom: 10, right: 10, child: PointsViewer(points: 276)),
            Positioned(
                bottom: 10,
                left: 10,
                child: ClimateParametersViewer(aqi: 118, temperature: 36))
          ]
        ]));
  }

  void _getMapObjects() async {
    Position currUserLocation = await _getCurrPosition();

    setState(() {
      _mapObjects = [
        MapObject(
          id: '1',
          mapObjectType: MapObjectTypes.currUserPosition,
          latitude: currUserLocation.latitude,
          longitude: currUserLocation.longitude,
          title: 'Test',
          details: 'Test',
        ),
      ];
    });
  }

  Future<Position> _getCurrPosition() async {
    // get current position
    // add to mapObjects
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  void _getName() {
    if (!mounted) {
      return;
    }
    User? user = _firebaseAuth.currentUser;
    if (user == null) {
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
      return;
    } else {
      print(user);
    }

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .snapshots()
    //     .listen((userData) {
    //   if (userData.data()!.containsKey('firstName') &&
    //       userData.data()!.containsKey('lastName')) {
    //     setState(() {
    //       _name = userData.data()!['firstName'] +
    //           ' ' +
    //           userData.data()!['lastName'];
    //     });
    //   }
    // });
  }
}
