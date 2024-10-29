import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_qrcode_scanner/flutter_web_qrcode_scanner.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_icon_button.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_theme.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            _controller.stopVideoStream();
            Navigator.pop(context, "");
          },
        ),
        title: Text(
          'ตรวจบัตรผ่าน',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
            fontFamily: 'Readex Pro',
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 0.0,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: FlutterWebQrcodeScanner(
          controller: _controller,
          cameraDirection: CameraDirection.back,
          stopOnFirstResult: true,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.9,
          onGetResult: (result) {
            Navigator.pop(context, result);
          },
        ),
      ),
    );
  }
}
