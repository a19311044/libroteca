// libro.dart
class Libro {
  final int? id;
  final String codigo;
  final String titulo;
  final String autor;
  final String fecha;
  final String isbn;
  final int numeroPaginas;
  final String editorial;
  final String genero;
  final String sinopsis;

  Libro({
    this.id,
    required this.codigo,
    required this.titulo,
    required this.autor,
    required this.fecha,
    required this.isbn,
    required this.numeroPaginas,
    required this.editorial,
    required this.genero,
    required this.sinopsis,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'titulo': titulo,
      'autor': autor,
      'fecha': fecha,
      'isbn': isbn,
      'numeroPaginas': numeroPaginas,
      'editorial': editorial,
      'genero': genero,
      'sinopsis': sinopsis,
    };
  }
}
