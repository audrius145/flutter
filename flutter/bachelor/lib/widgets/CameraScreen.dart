import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../pages/DisplayImageScreen.dart';
import 'Button.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({required this.cameras, Key? key}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  int direction = 0;
  late XFile image;

  void startCamera(int direction) async {
    cameraController = CameraController(
      widget.cameras[direction], ResolutionPreset.max,
      enableAudio: false
    );
    cameraValue = cameraController.initialize();
  }

  void captureImage(BuildContext context) {
    cameraController.takePicture().then((file) {
      setState(() {
        image = file;
      });
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayImageScreen(image: image)
          )
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startCamera(0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        FutureBuilder(
          future: cameraValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var camera = cameraController.value;
              var scale = size.aspectRatio * camera.aspectRatio;
              return CameraPreview(cameraController);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
        GestureDetector(
          onTap: () {
            captureImage(context);
          },
          child: Button(
            icon: Icons.camera_alt_outlined,
            alignment: Alignment.bottomCenter,
          )
        )
      ],
    );
  }
}
