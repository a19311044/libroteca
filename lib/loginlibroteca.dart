import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crearcuenta.dart'; // Asegúrate de importar correctamente el archivo de la página de creación de cuenta
import 'welcome_page.dart'; // Importa el archivo de la página de bienvenida

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0D2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Libroteca',
              style: TextStyle(
                fontFamily: 'Abhaya Libre',
                color: Color(0xFF6F4E0E),
                fontSize: 60,
              ),
            ),
            Image.network(
              'https://i.ibb.co/mNR2Prs/libroteca.png',
              width: 300,
              height: 216,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50),
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFF6F4E0E),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico o Usuario',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCEA75C), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6F4E0E), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color(0xFF6F4E0E), // Color del texto de la etiqueta
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCEA75C), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6F4E0E), width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Color(0xFF6F4E0E), // Color del texto de la etiqueta
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePageWidget(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Color(0xFF6F4E0E),
              ),
              child: Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                print('Olvidó su contraseña pressed ...');
              },
              child: Text('¿Olvidó su contraseña?'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountPageWidget(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Color(0xFFCEA75C),   // Cambia el color del texto a blanco
              ),
              child: Text('Crear una cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
