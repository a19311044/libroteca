import 'package:flutter_test/flutter_test.dart';
import 'package:libroteca/models/book.dart';
import 'package:libroteca/services/book_service.dart';
import 'package:libroteca/models/user.dart';
import 'package:libroteca/services/auth_service.dart';

void main() {
  const userId = 'unique_user_001';

  // Prueba para añadir un libro a la lista de favoritos
  test('Añadir libro a la lista de favoritos', () {
    final user = User(id: userId);
    final book = Book(title: 'Clean Code', authors: 'Robert C. Martin');
    user.addFavorite(book);
    expect(user.favorites.contains(book), true);
  });

  // Prueba para buscar libros a través de la API de Google Books
  test('Buscar libros a través de Google Books API', () async {
    final books = await BookService.fetchBooks('Flutter');
    expect(books.isNotEmpty, true);
    expect(books.first.title, isNotNull);
  });

  // Prueba para la autenticación de usuarios mediante Firebase
  test('Autenticación de usuario mediante Firebase', () async {
    const userEmail = 'user@example.com';
    const userPassword = 'password123';
    final result = await FirebaseAuthService.signIn(userEmail, userPassword);
    expect(result, true);
  });
}
