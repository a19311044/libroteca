import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'database_helper.dart';
import 'libro.dart';
import 'mostrarLibros.dart';
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
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _numeroPaginasController = TextEditingController();
  final TextEditingController _editorialController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();
  List<Libro> _libros = [];

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        setState(() {
          barcode = result.rawContent;
        });
      }
    } catch (e) {
      // Manejar el error de escaneo
    }
  }

  Future<void> guardarLibro() async {
    Libro nuevoLibro = Libro(
      codigo: barcode,
      titulo: _tituloController.text,
      autor: _autorController.text,
      fecha: _fechaController.text,
      isbn: _isbnController.text,
      numeroPaginas: int.tryParse(_numeroPaginasController.text) ?? 0,
      editorial: _editorialController.text,
      genero: _generoController.text,
      sinopsis: _sinopsisController.text,
    );

    await DatabaseHelper().insertLibro(nuevoLibro);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Libro guardado en la base de datos')));
  }

  Future<void> cargarLibros() async {
    List<Libro> libros = await DatabaseHelper().libros();
    setState(() {
      _libros = libros;
    });
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
              _buildTextField(label: 'Título', controller: _tituloController),
              _buildTextField(label: 'Autor', controller: _autorController),
              _buildTextField(label: 'Fecha', controller: _fechaController),
              _buildTextField(label: 'ISBN', controller: _isbnController),
              _buildTextField(label: 'No. de Páginas', controller: _numeroPaginasController),
              _buildTextField(label: 'Editorial', controller: _editorialController),
              _buildTextField(label: 'Género', controller: _generoController),
              _buildTextField(
                label: 'Sinópsis',
                maxLines: 5,
                controller: _sinopsisController,
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
                      backgroundColor: Colors.brown.shade200, // Color café claro
                      foregroundColor: Colors.brown.shade800, // Letras café oscuro
                    ),
                  ),
                  ElevatedButton(
                    onPressed: guardarLibro,
                    child: Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade200, // Color café claro
                      foregroundColor: Colors.brown.shade800, // Letras café oscuro
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar funcionalidad de agregar
                    },
                    child: Text('Agregar a mi Biblioteca'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown.shade200, // Color café claro
                      foregroundColor: Colors.brown.shade800, // Letras café oscuro
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MostrarLibros()),
                  );
                },
                child: Text('Mostrar Libros Guardados'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade200, // Color café claro
                  foregroundColor: Colors.brown.shade800, // Letras café oscuro
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _libros.length,
                itemBuilder: (context, index) {
                  final libro = _libros[index];
                  return ListTile(
                    title: Text(libro.titulo),
                    subtitle: Text(libro.autor),
                  );
                },
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

  Widget _buildTextField({required String label, required TextEditingController controller, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
