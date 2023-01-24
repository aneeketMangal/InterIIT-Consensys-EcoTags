import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _name = 'World';

  @override
  void initState() {
    super.initState();
    _getName();
  }

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Hello $_name',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final logoutButton = Padding(
      padding: EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            backgroundColor: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        onPressed: () {
          _firebaseAuth.signOut();
          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
        },
        child: Text('Logout', style: TextStyle(color: Colors.white)),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[
          alucard,
          welcome,
          lorem,
          SizedBox(height: 24.0),
          logoutButton,
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }

  void _getName() async {
    User? user = _firebaseAuth.currentUser;
    if (user == null) {
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
      return;
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots()
        .listen((userData) {
      if (userData.data()!.containsKey('firstName') &&
          userData.data()!.containsKey('lastName')) {
        setState(() {
          _name = userData.data()!['firstName'] +
              ' ' +
              userData.data()!['lastName'];
        });
      }
    });
  }
}
