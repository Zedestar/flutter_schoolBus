import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Rest easy your child is in safe hands",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/bus_pic.png',
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
