import 'package:course_app/src/features/feature_name/domain/entities/book.dart';

abstract class BookRepository {
  Future<BookEntity> getBook();
  Future<BookEntity> addBook(BookEntity book);
  Future<BookEntity> removeBook();
}