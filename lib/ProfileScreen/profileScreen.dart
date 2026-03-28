import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'In_ProfileScreen/avatar.dart';
import 'In_ProfileScreen/background_image.dart';
import 'In_ProfileScreen/save_button.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Background_Image(),
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                              icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.w),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications, color: Colors.white, size: 24.w),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -40.h, 
                      left: 20.w, 
                      child: Stack(
                        children: [
                            const ProfileAvatar(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('202412345', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400)),
                          SizedBox(width: 8.w),
                          Text('#username', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14.sp)),
                        ],
                      ),
                      Text('Dev team member', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 14.sp)),
                      
                      SizedBox(height: 20.h),
                      _buildFieldLabel('Display name'),
                      _buildTextField('Your name'),
                      
                      SizedBox(height: 7.h),
                      
                      _buildFieldLabel('Username'),
                      _buildTextField('Your username'),
                      
                      SizedBox(height: 7.h),
                      
                      _buildFieldLabel('Team'),
                      _buildDropdownField('Your team'),

                      SizedBox(height: 7.h),
                      Center(
                        child:Save_Button(onPressed: () {
                        }),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(label, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
    );
  }
  Widget _buildTextField(String hint) {
    return Center(
      child: SizedBox(
        width: 324.w,
        height: 57.h,
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFFD9D9D9),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          ),
        ),
     ),
    );
  }
  Widget _buildDropdownField(String hint) {
    return SizedBox(
      width: 324.w,
      height: 57.h,
      child: DropdownButtonFormField<String>(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
          size: 24.w,
        ),
        style: TextStyle(
          fontSize: 16.sp,
          color: Theme.of(context).colorScheme.secondary
        ),

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFFD9D9D9),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        items: ['DEVELOPER', 'MARCOM', 'OPERATION']
            .map((team) => DropdownMenuItem<String>(
                  value: team,
                  child: Text(team, style: GoogleFonts.alexandria(fontSize: 16.sp)),
                ))
            .toList(),
        onChanged: (value) {
        },
      ),
    );
  }
}
