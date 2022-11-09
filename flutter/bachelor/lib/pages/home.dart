import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:native_opencv/native_opencv.dart';

import '../widgets/CameraScreen.dart';

class Home extends StatelessWidget {
  const Home({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    final nativeOpencv = NativeOpencv();
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenCV version: ${nativeOpencv.cvVersion()}'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
        body: CameraScreen(cameras: cameras),
    );
  }
}

