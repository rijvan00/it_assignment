import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/gallery_view.dart';
import 'package:flutter_riverpod_base/src/utils/router.dart';

class SplashScreen extends StatefulWidget {
  static const routePath = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      router.pushReplacement(GalleryView.routePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          'Assignment',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
