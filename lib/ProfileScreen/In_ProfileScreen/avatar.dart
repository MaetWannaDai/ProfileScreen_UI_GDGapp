import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
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
    return Stack(
      children: [
        InkWell(
          onTap: _pickImage, 
          borderRadius: BorderRadius.circular(45.r),
          child: CircleAvatar(
            radius: 45.r,
            backgroundColor: const Color(0xFFC4C4C4), 
            backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
            child: _selectedImage == null
                ? Icon(Icons.person, size: 60.r, color: Colors.white)
                : null,
          ),
        ),
        if (_selectedImage == null)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 14.r,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              child: InkWell(
                onTap: _pickImage, 
                borderRadius: BorderRadius.circular(14.r),
                child: Icon(Icons.camera_alt, color: const Color(0xFF666C73), size: 16.w),
              ),
            ),
          ),
      ],
    );
  }
}