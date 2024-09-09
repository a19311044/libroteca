import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'loginlibroteca.dart';
import 'splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libroteca',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(), // Comienza con la pantalla de splash
    );
  }
}

