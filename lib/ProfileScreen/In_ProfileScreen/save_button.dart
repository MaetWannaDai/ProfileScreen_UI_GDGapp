import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Save_Button extends StatelessWidget {
  final VoidCallback onPressed;

  const Save_Button({
    super.key, 
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 270.w,
        height: 70.h,
        child: ElevatedButton(
          onPressed: onPressed, 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A050),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            elevation: 0,
          ),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}