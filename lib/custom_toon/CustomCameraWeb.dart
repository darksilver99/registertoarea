import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:register_to_area/auth/firebase_auth/auth_util.dart';
import 'package:register_to_area/backend/firebase_storage/storage.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_icon_button.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_theme.dart';

class CustomCameraWeb extends StatefulWidget {
  const CustomCameraWeb({super.key});

  @override
  State<CustomCameraWeb> createState() => _CustomCameraWebState();
}

class _CustomCameraWebState extends State<CustomCameraWeb> {
  late CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      List<CameraDescription> camera = await availableCameras();
      print("camera.length : ${camera.length}");
      controller = CameraController(camera[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isReady = true;
        });
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              print(e.description);
              break;
            default:
              // Handle other errors here.
              print(e.description);
              break;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _firebasePathPrefix() => 'users/$currentUserUid/uploads';

  String? _removeTrailingSlash(String? path) =>
      path != null && path.endsWith('/')
          ? path.substring(0, path.length - 1)
          : path;

  String _getStoragePath(
    String? pathPrefix,
    String filePath,
    bool isVideo, [
    int? index,
  ]) {
    pathPrefix ??= _firebasePathPrefix();
    pathPrefix = _removeTrailingSlash(pathPrefix);
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final ext = isVideo ? 'mp4' : filePath.split('.').last;
    final indexStr = index != null ? '_$index' : '';
    return '$pathPrefix/$timestamp$indexStr.$ext';
  }

  Future<dynamic> onTakePictureButtonPressed() async {
    var file = await takePicture();
    print("file!.path");
    print(file!.path);
    final tmpImage = await file!.readAsBytes();
    final mediaBytes = await FlutterImageCompress.compressWithList(tmpImage,
        minHeight: 400, quality: 80);
    final path = _getStoragePath(null, file!.name, false);
    final url = await uploadData(path, mediaBytes);
    Navigator.pop(context, url);
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return Container(
        child: Text("Loading..."),
      );
    }
    return Scaffold(
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
            await controller.dispose();
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
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(controller),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: FlutterFlowTheme.of(context).primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.blue,
                        onPressed: controller != null &&
                                controller.value.isInitialized &&
                                !controller.value.isRecordingVideo
                            ? onTakePictureButtonPressed
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
