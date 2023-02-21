import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPreview extends StatefulWidget {
  const CameraPreview({super.key});

  @override
  State<CameraPreview> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreview> {
  CameraController? controller;
  List<CameraDescription> availCameras = [];
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();

    initCamera();
  }

  void initCamera() async {
    availCameras = await availableCameras();
    if (availCameras.isNotEmpty) {
      controller = CameraController(availCameras[0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isCameraInitialized = true;
        });
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CamPreview'),
      ),
      body: (isCameraInitialized)
          ? const Text('B')
          : const Center(
              child: Text('Uruchamiam kamerę'),
            ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
