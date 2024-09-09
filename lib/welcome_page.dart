import 'package:flutter/material.dart';
import 'my_account_page.dart'; // Asegúrate de importar el archivo correcto para la página de mi cuenta

class WelcomePageWidget extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF0D2),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido, Carlosx',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF6F4E0E),
                      fontSize: 40,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://i.ibb.co/mNR2Prs/libroteca.png',
                      width: 300,
                      height: 224,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Funcionalidad para la primera imagen de la navbar
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
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Funcionalidad para la segunda imagen de la navbar
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
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyAccountPageWidget(),
                              ),
                            );
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
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
