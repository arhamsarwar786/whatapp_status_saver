import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/utill/apptext.dart';
import 'package:whatsapp_status_saver/utill/navigation.dart';


import 'home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
   late AnimationController _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    Future.delayed(Duration(seconds: 3), () {
      pushScreen(context, Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation!,
            child: Center(child: Image.asset("assets/images/status_saver.webp", width: 200, height: 200)),
          ),
          SizedBox(height: 10),
          FadeTransition(
            opacity: _animation!,
            child: AppText(text: "Save Photos and Images", fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}