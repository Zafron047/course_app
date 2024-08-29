import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';

abstract class BookRepository {
  Future<void> addBook(BookEntity book);
  Future<void> removeBook(String bookId);
  Future<BookEntity> getBook(String bookId);
}