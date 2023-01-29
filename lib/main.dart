import 'package:ecotags/const/color.dart';
import 'package:ecotags/screens/camera.dart';
import 'package:ecotags/screens/home.dart';
import 'package:ecotags/screens/login.dart';
import 'package:ecotags/screens/signup.dart';
import 'package:ecotags/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final List<CameraDescription> cameras =
      await availableCameras(); //Get list of available cameras
  runApp(MyApp(camera: cameras[0]));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      LoginScreen.tag: (context) => LoginScreen(),
      HomeScreen.tag: (context) => HomeScreen(camera: camera),
      SignUpScreen.tag: (context) => SignUpScreen(),
      WelcomeScreen.tag: (context) => WelcomeScreen(),
    };

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
          title: 'Eco Tags',
          theme: ThemeData(
            backgroundColor: backgroundColor,
            // primaryColor: primaryColor,
            // secondaryColor: secondaryColor,
            // primarySwatch: appColor
          ),
          home: MaterialApp(
            title: 'Login',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              fontFamily: 'Nunito',
            ),
            home: WelcomeScreen(),
            routes: routes,
          )),
    );
  }
}
