import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';

class CustomCarmera extends StatefulWidget {
  const CustomCarmera({super.key});

  @override
  State<CustomCarmera> createState() => _CustomCarmeraState();
}

class _CustomCarmeraState extends State<CustomCarmera> {
  final CameraController _controller = CameraController(autoPlay: true);

  @override
  void dispose() {

    _controller.stopVideoStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterWebQrcodeScanner(
        controller: _controller,
        cameraDirection: CameraDirection.back,
        stopOnFirstResult: true,
        //set false if you don't want to stop video preview on getting first result
        onGetResult: (result) {
          Navigator.pop(context, result);
        },
      ),
    );
  }
}
