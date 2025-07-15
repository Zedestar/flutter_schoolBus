import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakingPicWidget extends StatefulWidget {
  TakingPicWidget({super.key, required this.userImageProfile});

  File? userImageProfile;

  @override
  State<TakingPicWidget> createState() => _TakingPicWidgetState();
}

class _TakingPicWidgetState extends State<TakingPicWidget> {
  // File? _userImageProfile;

  Future<void> imagePickerFunction() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        widget.userImageProfile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(
        0,
        5,
        0,
        0,
      ),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: widget.userImageProfile == null
          ? IconButton(
              onPressed: imagePickerFunction,
              icon: Icon(
                Icons.camera,
              ),
            )
          : InkWell(
              onTap: imagePickerFunction,
              child: Image.file(
                widget.userImageProfile!,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
