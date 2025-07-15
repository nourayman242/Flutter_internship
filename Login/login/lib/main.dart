import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/login_page.dart';


void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
