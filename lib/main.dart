import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile_screen_app/ProfileNavScreen/ProfileNavScreen.dart';
import 'package:profile_screen_app/themes/themeprovider.dart';
import 'package:provider/provider.dart';
import 'homscreen/homescreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(   // ChangeNotifierprovider for the Theme change
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget { // Stateless widget has been converted into Stateful widget for theme changing
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Profile',
          home: const ProfileNavScreen(),
          theme: Provider.of<Themeprovider>(context).themeData,
        );
      },
    );
  }
}
