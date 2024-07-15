import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'libro.dart';

class MostrarInformacionLibros extends StatefulWidget {
  @override
  _MostrarInformacionLibrosState createState() =>
      _MostrarInformacionLibrosState();
}

class _MostrarInformacionLibrosState extends State<MostrarInformacionLibros> {
  late Future<List<Libro>> _librosFuture;

  @override
  void initState() {
    super.initState();
    _librosFuture = DatabaseHelper().libros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Libros'),
      ),
      body: FutureBuilder<List<Libro>>(
        future: _librosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los libros'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay libros disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Libro libro = snapshot.data![index];
                return ListTile(
                  title: Text(libro.titulo),
                  subtitle: Text(libro.autor),
                  trailing: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleLibroScreen(libro: libro),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class DetalleLibroScreen extends StatelessWidget {
  final Libro libro;

  const DetalleLibroScreen({Key? key, required this.libro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(libro.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Autor: ${libro.autor}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Fecha: ${libro.fecha}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'ISBN: ${libro.isbn}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Número de Páginas: ${libro.numeroPaginas}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Editorial: ${libro.editorial}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Género: ${libro.genero}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
