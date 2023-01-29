import 'package:ecotags/const/color.dart';
import 'package:ecotags/screens/home.dart';
import 'package:ecotags/screens/login.dart';
import 'package:ecotags/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatelessWidget {
  static String tag = 'welcome-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: <Widget>[
          // add empty space
          const SizedBox(height: 200),
          Container(
              width: 375,
              height: 152,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.fitWidth),
              )),
          // add empty space

          const SizedBox(height: 80),
          Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36.0, color: primaryTextColor),
          ),

          // const SizedBox(height: 100),
          Text(
            "The only place where you can \nconnect, clean and be green",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.0, color: secondaryTextColor),
          ),
          const SizedBox(height: 100),
          Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpScreen.tag);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20, color: appColor),
                ),
              )),
          const SizedBox(height: 20),

          SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.tag);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  // border

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: primaryColor),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, color: primaryColor),
                ),
              )),

          const SizedBox(height: 50),
          Text(
            'All Right Reserved @2021',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: primaryColor,
                fontSize: 11,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),

          //   Container(
          //       width: 300,
          //       height: 50,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.of(context).pushNamed(HomeScreen.tag);
          //         },
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: primaryColor,
          //           // border

          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10.0),
          //           ),
          //         ),
          //         child: Text(
          //           'Main Screen',
          //           style: TextStyle(fontSize: 20, color: appColor),
          //         ),
          //       )),
        ]));
  }
}

/**
 * 

      Positioned(
          top: 408,
          left: 51,
          child: Container(
              width: 273,
              height: 121,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 57,
                    left: 0,
                    child: Text(
                      'The only place where you can connect, clean and be green',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Baloo Bhai 2',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 0,
                    left: 61,
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(144, 255, 105, 1),
                          fontFamily: 'Roboto',
                          fontSize: 36,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ]))),
      Positioned(
          top: 606,
          left: 47,
          child: Container(
              width: 281,
              height: 135,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 281,
                        height: 60,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 281,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(255, 222, 105,
                                              0.15000000596046448),
                                          offset: Offset(-1, 1),
                                          blurRadius: 10)
                                    ],
                                    color: Color.fromRGBO(144, 255, 105, 1),
                                    border: Border.all(
                                      color: Color.fromRGBO(239, 87, 87, 1),
                                      width: 3,
                                    ),
                                  ))),
                          Positioned(
                              top: 15,
                              left: 71,
                              child: Text(
                                'Create Account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(27, 26, 64, 1),
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ]))),
                Positioned(
                    top: 75,
                    left: 0,
                    child: Container(
                        width: 281,
                        height: 60,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 281,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(255, 222, 105,
                                              0.15000000596046448),
                                          offset: Offset(-1, 1),
                                          blurRadius: 10)
                                    ],
                                    border: Border.all(
                                      color: Color.fromRGBO(144, 255, 105, 1),
                                      width: 3,
                                    ),
                                  ))),
                          Positioned(
                              top: 14,
                              left: 115,
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(144, 255, 105, 1),
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ]))),
              ]))),
      Positioned(
          top: 777,
          left: 124,
          child: Container(
              width: 126,
              height: 15,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Text(
                      'All Right Reserved @2021',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(135, 192, 116, 1),
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ]))),
 * 
 */