import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'home.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/logo.png"),
      title: const Text(
        "   Portfolio\nGopal Shibu",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      logoWidth: 80,
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: Home(),
      durationInSeconds: 2,
    );
  }
}
