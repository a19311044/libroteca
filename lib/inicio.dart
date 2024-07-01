import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

void main() {
  runApp(LibrotecaApp());
}

class LibrotecaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libroteca',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LibrotecaHomePage(),
    );
  }
}

class LibrotecaHomePage extends StatefulWidget {
  @override
  _LibrotecaHomePageState createState() => _LibrotecaHomePageState();
}

class _LibrotecaHomePageState extends State<LibrotecaHomePage> {
  String barcode = "";

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        setState(() {
          barcode = result.rawContent;
          // Puedes actualizar otros campos según el resultado del escaneo aquí
        });
      }
    } catch (e) {
      // Manejar el error de escaneo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libroteca'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Escanear/Escribir código de libro',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: scanBarcode,
                  ),
                ),
                controller: TextEditingController(text: barcode),
              ),
              SizedBox(height: 16),
              _buildTextField(label: 'Título'),
              _buildTextField(label: 'Autor'),
              _buildTextField(label: 'Fecha'),
              _buildTextField(label: 'ISBN'),
              _buildTextField(label: 'No. de Páginas'),
              _buildTextField(label: 'Editorial'),
              _buildTextField(label: 'Género'),
              _buildTextField(
                label: 'Sinópsis',
                maxLines: 5,
              ),
              SizedBox(height: 16),
              Image.asset(
                'assets/1984.jpg',
                height: 150,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implementar funcionalidad de limpiar
                    },
                    child: Text('Limpiar consulta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar funcionalidad de agregar
                    },
                    child: Text('Agregar a mi Biblioteca'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.brown,
      ),
    );
  }

  Widget _buildTextField({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
