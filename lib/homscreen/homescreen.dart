import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ProfileScreen/profileScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 2;
  
  late final List<Widget> _pages = [
    Center(child: Text('Đây là trang Home', style: TextStyle(fontSize: 24.sp))),
    Center(child: Text('Đây là trang Memories', style: TextStyle(fontSize: 24.sp))),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15.r,
              offset: Offset(0, 5.h)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem('assets/images/home.png', 'Home', 0),
            _buildNavItem('assets/images/photo.png', 'Memories', 1),
            _buildNavItem('assets/images/user.png', 'Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        color: Colors.transparent, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath, 
              width: 24.w, 
              height: 24.w, 
              fit: BoxFit.contain
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.blue : Colors.grey,
                fontSize: 12.sp,
                fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}