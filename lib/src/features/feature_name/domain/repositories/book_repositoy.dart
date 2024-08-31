import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';

abstract class BookRepository {
  Future<void> addBook(BookEntity book);
  Future<BookEntity> getBook(String bookId);
  Future<List<BookEntity>> getBooks();
  Future<BookEntity> updateBook(String bookId);
  Future<void> removeBook(String bookId);
}
