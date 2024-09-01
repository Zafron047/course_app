import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';

abstract class BookRepository {
  // CRUD operations
  // Create
  Future<void> addBook(BookEntity book);
  // Read
  Future<BookEntity> getBook(String bookId);
  Future<List<BookEntity>> getBooks();
  // Update
  Future<BookEntity> updateBook(String bookId);
  // Delete
  Future<void> removeBook(String bookId);
}
