
import '../../entities/books/book_entity.dart';
import '../../repositories/books/book_repository.dart';

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

  Future<BookEntity> editBook(String bookId) async {
    return await _bookRepository.updateBook(bookId);
  }
}
