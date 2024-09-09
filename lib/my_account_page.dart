import 'package:flutter/material.dart';
import 'loginlibroteca.dart'; // Asegúrate de importar la página de inicio de sesión correcta

const Color myNavBarColor = Color(0xFFFFF0D2);

class MyAccountPageWidget extends StatefulWidget {
  const MyAccountPageWidget({Key? key}) : super(key: key);

  @override
  State<MyAccountPageWidget> createState() => _MyAccountPageWidgetState();
}

class _MyAccountPageWidgetState extends State<MyAccountPageWidget> {
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cerrar sesión"),
          content: Text("¿Estás seguro de que deseas cerrar sesión?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar lógica para cerrar sesión
                // Por ahora, simplemente navegaremos a la página de inicio de sesión
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Reemplaza la página actual
                );
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFFFFF0D2), // Fondo principal de la página
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://i.ibb.co/mNR2Prs/libroteca.png',
                            width: 192,
                            height: 144,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Mi Cuenta',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF6F4E0E),
                          fontSize: 48,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img.icons8.com/?size=2000&id=98957&format=png&color=6f4e0e',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Datos generales',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF6F4E0E),
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img.icons8.com/?size=2000&id=85761&format=png&color=6f4e0e',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Seguridad',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF6F4E0E),
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img.icons8.com/?size=100&id=90568&format=png&color=6f4e0e',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Contáctanos',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF6F4E0E),
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img.icons8.com/?size=100&id=8RxtL2T52JuT&format=png&color=6f4e0e',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Desactivar o Eliminar cuenta',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF6F4E0E),
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://img.icons8.com/?size=100&id=59781&format=png&color=6f4e0e',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  _showLogoutDialog(); // Mostrar alerta al cerrar sesión
                                },
                                child: Text(
                                  'Cerrar sesión',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF6F4E0E),
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: myNavBarColor, // Aquí se aplica el color personalizado de la navbar
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Función para navegar a la página de bienvenida
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://img.icons8.com/?size=100&id=2797&format=png&color=6f4e0e',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Función para la segunda imagen de la navbar
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://img.icons8.com/?size=100&id=9492&format=png&color=6f4e0e',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Función para la tercera imagen de la navbar
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://img.icons8.com/?size=100&id=9ZgJRZwEc5Yj&format=png&color=6f4e0e',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
