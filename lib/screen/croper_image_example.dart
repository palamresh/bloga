import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CroperImageExample extends StatefulWidget {
  const CroperImageExample({super.key});

  @override
  State<CroperImageExample> createState() => _CroperImageExampleState();
}

class _CroperImageExampleState extends State<CroperImageExample> {
  File? pickedfile;
  final imagePikcer = ImagePicker();

  void showImagePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          size: 60,
                        )),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          getImageFromCamera();
                        },
                        icon: Icon(
                          Icons.image,
                          size: 60,
                        )),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void getImageFromCamera() async {
    final pickedimage = await imagePikcer.pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      setState(() {
        pickedfile = File(pickedimage.path);
        cropImage(pickedfile!);
      });
    } else {
      print('image can\'t pick');
    }
  }

  Future<void> cropImage(File picked) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        pickedfile = File(croppedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Croper Image Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: pickedfile != null
                ? Image.file(pickedfile!)
                : Image.network(
                    'https://tse4.mm.bing.net/th?id=OIP._7jjxcm6qd1eqnVxNFQLygHaGN&pid=Api&P=0&h=220'),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                Map<Permission, PermissionStatus> status =
                    await [Permission.storage, Permission.camera].request();

                if (status[Permission.storage]!.isGranted &&
                    status[Permission.camera]!.isGranted) {
                  showImagePicker();
                  // getImageFromCamera();
                } else {
                  AppSettings.openAppSettings(type: AppSettingsType.settings);
                }
              },
              child: Text('Select Image'))
        ],
      ),
    );
  }
}
