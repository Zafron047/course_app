import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/Book/book_repositoy.dart';

class BookUsecases {
  final BookRepository _bookRepository;

  BookUsecases(this._bookRepository);

  Future<void> addBook(BookEntity book, String adminId) async {
    return await _bookRepository.addBook(book);
  }

  Future<void> removeBook(String bookId, String adminId) async {
    return await _bookRepository.removeBook(bookId);
  }

  Future<BookEntity> getBook(String bookId) async {
    return await _bookRepository.getBook(bookId);
  }
}