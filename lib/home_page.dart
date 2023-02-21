import 'package:flutter/material.dart';
import 'package:flutter_cam_plus_tree/camera_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const CameraPreview();
              }));
            },
            child: const Text('Uruchom'),
          ),
        ],
      ),
    ));
  }
}
