import 'package:flutter/material.dart';
import 'package:mockva_app/src/pages/dashboard/dashboard_navigation.dart';
import 'package:mockva_app/src/utils/values/strings.dart';
import 'package:mockva_app/src/utils/values/themes.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: splashScreens(),
    );
  }
}

// ignore: camel_case_types
class splashScreens extends StatefulWidget {
  @override
  splashScreensState createState() => splashScreensState();
}

// ignore: camel_case_types
class splashScreensState extends State<splashScreens> {
  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DashboardNavigation()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: splashscreen());
  }

  Widget splashscreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              Dictionary.celCome,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
