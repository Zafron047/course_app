import '../../../../domain/entities/books/book_entity.dart';

abstract class BookDataSources {
  // Create
  Future<void> addBook(BookEntity book);
  // Read
  Future<BookEntity?> getBook(String bookId);
  Future<List<BookEntity?>> getBooks();
  // Update
  Future<BookEntity?> updateBook(String bookId, BookEntity updatedBook);
  // Delete
  Future<void> removeBook(String bookId);
}
