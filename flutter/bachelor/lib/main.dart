import 'package:bachelor/pages/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MaterialApp(routes: {
    '/': (context) => Home(cameras: cameras)
  }));

}


