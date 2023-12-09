import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:fixitnow/models/file.dart';
import 'package:fixitnow/screens/common/components/row_images_widget.dart';
import 'package:fixitnow/screens/common/galleries.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';

List<CameraDescription> cameras = [];

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool flash = false;
  List<FileModel> files = [];
  FileModel? selectedModel;
  String? image;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();

    getImagesPath();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
    //getImagesPath();
  }

  Future<void> getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files.isNotEmpty) {
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
      for (String fileModel in files[1].files) {
        debugPrint('files: $fileModel');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            top: 40.0,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 8.0),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80.0,
            child: files.isNotEmpty
                ? RowImageWidget(
                    fileModel: files[1],
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: CustomColor.primaryColors.withOpacity(.7),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        flash = !flash;
                      });
                      flash
                          ? _cameraController.setFlashMode(FlashMode.torch)
                          : _cameraController.setFlashMode(FlashMode.off);
                    },
                    icon: Icon(
                      flash ? Icons.flash_off : Icons.flash_on,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      XFile xFile = await _cameraController.takePicture();
                      debugPrint('xFile.path ${xFile.path}');
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.panorama_fish_eye,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GalleryScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
