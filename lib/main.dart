 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/provider/images_provider.dart';
import 'package:whatsapp_status_saver/provider/tab_provider.dart';
import 'package:whatsapp_status_saver/provider/videos_provider.dart';

import 'package:whatsapp_status_saver/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>TabProvider()),
      ChangeNotifierProvider(create: (_)=>ImagesProvider()),
      ChangeNotifierProvider(create: (_)=>VideosProvider()),
    ],child: MaterialApp(
      home: SplashScreen(),
    ));
  }
}
