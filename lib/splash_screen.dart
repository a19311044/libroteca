import 'package:flutter/material.dart';
import 'loginlibroteca.dart';  // Asegúrate de que la importación esté correcta

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0D2),
      body: Center(
        child: Image.network(
          'https://i.ibb.co/mNR2Prs/libroteca.png',
          width: 192,
          height: 144,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
