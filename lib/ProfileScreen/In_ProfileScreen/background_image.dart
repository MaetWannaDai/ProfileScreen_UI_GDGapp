import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Background_Image extends StatefulWidget {
  const Background_Image({super.key});

  @override
  State<Background_Image> createState() => _Background_ImageState();
}

class _Background_ImageState extends State<Background_Image> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 196.h,
        decoration: BoxDecoration( 
          image: DecorationImage(
            image: _selectedImage != null
                ? FileImage(_selectedImage!) as ImageProvider
                : const AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}