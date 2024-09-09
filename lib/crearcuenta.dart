import 'package:flutter/material.dart';
import 'package:libroteca/loginlibroteca.dart';

class CreateAccountPageWidget extends StatefulWidget {
  @override
  _CreateAccountPageWidgetState createState() => _CreateAccountPageWidgetState();
}

class _CreateAccountPageWidgetState extends State<CreateAccountPageWidget> {
  final TextEditingController nombreTxtController = TextEditingController();
  final FocusNode nombreTxtFocusNode = FocusNode();

  final TextEditingController apellidoTxtController = TextEditingController();
  final FocusNode apellidoTxtFocusNode = FocusNode();

  final TextEditingController usuarioTxtController = TextEditingController();
  final FocusNode usuarioTxtFocusNode = FocusNode();

  final TextEditingController correoTxtController = TextEditingController();
  final FocusNode correoTxtFocusNode = FocusNode();

  final TextEditingController contrasenaTxtController = TextEditingController();
  final FocusNode contrasenaTxtFocusNode = FocusNode();

  final TextEditingController contrasena2TxtController = TextEditingController();
  final FocusNode contrasena2TxtFocusNode = FocusNode();

  @override
  void dispose() {
    nombreTxtController.dispose();
    nombreTxtFocusNode.dispose();
    apellidoTxtController.dispose();
    apellidoTxtFocusNode.dispose();
    usuarioTxtController.dispose();
    usuarioTxtFocusNode.dispose();
    correoTxtController.dispose();
    correoTxtFocusNode.dispose();
    contrasenaTxtController.dispose();
    contrasenaTxtFocusNode.dispose();
    contrasena2TxtController.dispose();
    contrasena2TxtFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
 return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF0D2),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60), // Espacio adicional arriba
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://i.ibb.co/mNR2Prs/libroteca.png',
                      width: 290,
                      height: 262,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFF6F4E0E),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: nombreTxtController,
                      focusNode: nombreTxtFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFCEA75C), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF6F4E0E), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: apellidoTxtController,
                      focusNode: apellidoTxtFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Apellidos',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFCEA75C), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF6F4E0E), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: usuarioTxtController,
                      focusNode: usuarioTxtFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFCEA75C), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF6F4E0E), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: correoTxtController,
                      focusNode: correoTxtFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFCEA75C), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF6F4E0E), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: contrasenaTxtController,
                      focusNode: contrasenaTxtFocusNode,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFCEA75C), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF6F4E0E), width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Añadimos espacio adicional
                  FFButtonWidget(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Aviso'),
                            content: const Text('La cuenta ha sido creada con éxito'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    text: 'Crear cuenta',
                    options: FFButtonOptions(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      color: const Color(0xFF6F4E0E),
                      textStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 30), // Añadimos más espacio adicional
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    text: 'Atrás',
                    options: FFButtonOptions(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      color: const Color(0xFFCEA75C),
                      textStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 55),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FFButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final FFButtonOptions options;

  FFButtonWidget({
    required this.onPressed,
    required this.text,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: options.height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: options.padding, backgroundColor: options.color,
            textStyle: options.textStyle,
            elevation: options.elevation,
            side: options.borderSide,
            shape: RoundedRectangleBorder(
              borderRadius: options.borderRadius,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FFButtonOptions {
  final double height;
  final EdgeInsetsGeometry padding;
  final Color color;
  final TextStyle textStyle;
  final double elevation;
  final BorderSide borderSide;
  final BorderRadiusGeometry borderRadius;

  FFButtonOptions({
    required this.height,
    required this.padding,
    required this.color,
    required this.textStyle,
    required this.elevation,
    required this.borderSide,
    required this.borderRadius,
  });
}
