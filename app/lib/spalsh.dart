import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'onboardscreens.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/images/Furniture.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'HomeCraft',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 151, 132, 125),
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
                Text(
                  'Modern Furniture',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
