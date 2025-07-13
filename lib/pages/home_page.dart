import 'package:flutter/material.dart';
import 'package:school_bus/pages/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.sailing_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignupPage();
              }));
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "This is the home page",
        ),
      ),
    );
  }
}
