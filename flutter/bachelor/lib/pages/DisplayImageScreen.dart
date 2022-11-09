import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayImageScreen extends StatelessWidget {
  final XFile image;

  const DisplayImageScreen({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Taken picture'),
        ),
        body: Image.file(File(image.path), fit: BoxFit.contain),
    );
  }
}
