import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prakkamera/native_camera_page.dart';
import 'package:prakkamera/storage_helper.dart';

class FullPage extends StatefulWidget {
  const FullPage({super.key});

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  File? _imageFile;

  Future<void> _requestPermissions() async {        //fungsi untuk meminta permission kamera dan penyimpanan
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {             //fungsi untuk mengambil foto menggunakan halaman kamera
    await _requestPermissions();
    final File? result = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result != null) {
      final saved = await StorageHelper.SaveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Disimpan: ${saved.path}')));
    }
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}