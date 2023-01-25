import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImageFile != null) {
        _pickedImage = File(pickedImageFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[350],
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage as File) : null,
        ),
        TextButton.icon(
          icon: const Icon(Icons.image),
          label: const Text('Add image'),
          onPressed: _pickImage,
        ),
      ],
    );
  }
}
