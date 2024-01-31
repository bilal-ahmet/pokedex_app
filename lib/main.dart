import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POKEDEX',
        theme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
        home: HomePage(),
      );
      },
    );
  }
}