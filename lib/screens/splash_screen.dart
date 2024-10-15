import 'package:flutter/material.dart';
import 'dart:async'; // Required for using Timer
import 'package:mini_project/main.dart'; // Ensure to import your Homepage file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Homepage after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/daily.png", // Replace with your app logo path
              height: 150, // Adjust height as needed
              width: 150, // Adjust width as needed
            ),
            const SizedBox(height: 20),
            const Text(
              'Daily.dev', // Replace with your app name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set your desired color
              ),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(), // Optional loading indicator
          ],
        ),
      ),
    );
  }
}
