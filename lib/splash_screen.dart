import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {  
    super.initState();
    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

    // Navigate to the home screen after 3 seconds
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/TRD1.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            LoadingAnimationWidget.twistingDots(leftDotColor: const Color(0xFF1A1A3F), rightDotColor: const Color(0xFFEA3799), size: 20)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Show status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
