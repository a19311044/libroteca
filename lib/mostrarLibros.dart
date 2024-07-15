import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'libro.dart';

class MostrarLibros extends StatefulWidget {
  @override
  _MostrarLibrosState createState() => _MostrarLibrosState();
}

class _MostrarLibrosState extends State<MostrarLibros> {
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
        title: Text('Lista de Libros'),
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
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                  horizontalMargin: 12,
                  columnSpacing: 12,
                  dataRowHeight: 56,
                  columns: [
                    DataColumn(
                      label: Text('Título'),
                      numeric: false, // Alineación izquierda
                    ),
                    DataColumn(
                      label: Text('Autor'),
                      numeric: false, // Alineación izquierda
                    ),
                    DataColumn(
                      label: Text('Información'),
                      numeric: false, // Alineación izquierda
                    ),
                  ],
                  rows: snapshot.data!.map((libro) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(libro.titulo),
                        ),
                        DataCell(
                          Text(libro.autor),
                        ),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // Acción al presionar el icono de búsqueda
                            },
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
