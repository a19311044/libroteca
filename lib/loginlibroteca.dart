import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginLibroteca extends StatefulWidget {
  @override
  _LoginLibrotecaState createState() => _LoginLibrotecaState();
}

class _LoginLibrotecaState extends State<LoginLibroteca> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin(BuildContext context) async {
    try {
      var url = 'http://localhost:3000/login'; // URL de tu servidor Node.js

      var response = await http.post(Uri.parse(url), body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      });

      if (response.statusCode == 200) {
        print('Respuesta del servidor: ${response.body}');
        var data = jsonDecode(response.body); // Convertir la respuesta JSON a un objeto Dart

        if (data['success']) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login exitoso')));
          // Implementa la navegación a la siguiente pantalla o acción deseada
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
        }
      } else {
        print('Error en la solicitud: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error en la solicitud')));
      }
    } catch (e) {
      print('Error al conectar al servidor: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al conectar al servidor')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFF0D2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Libroteca',
              style: GoogleFonts.abhayaLibre(
                fontWeight: FontWeight.w400,
                fontSize: 64,
                color: Color(0xFF6F4E0E),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                color: Colors.transparent,
                backgroundBlendMode: BlendMode.multiply,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/loginlogo.png'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildLoginForm(),
            ),
            SizedBox(height: 20),
            _buildAdditionalLinks(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Usuario',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _handleLogin(context); // Llamar al método de manejo de login
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // Implementar la lógica para 'Forgot password?'
          },
          child: Text('Forgot password?'),
        ),
        SizedBox(width: 20),
        TextButton(
          onPressed: () {
            // Implementar la lógica para 'Create an account'
          },
          child: Text('Create an account'),
        ),
      ],
    );
  }
}
