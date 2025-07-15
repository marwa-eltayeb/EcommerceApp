import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Onboard Screen", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

