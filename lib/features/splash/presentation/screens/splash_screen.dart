import 'package:flutter/material.dart';
import 'dart:async';
import 'package:products_app/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onboardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        // Centered Content
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kutuku',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Any Shopping Just from home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),


          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              'Version 0.0.1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
