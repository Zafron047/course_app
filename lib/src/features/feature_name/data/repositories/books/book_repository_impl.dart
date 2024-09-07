import 'package:course_app/src/features/feature_name/domain/entities/books/book_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/books/book_repository.dart';

import '../../datasources/remote/books/book_data_sources.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDataSources _bookDataSource;
  BookRepositoryImpl(this._bookDataSource);

  @override
  Future<void> addBook(BookEntity book) async {
    await _bookDataSource.addBook(book);
  }

  @override
  Future<BookEntity?> getBook(String bookId) async {
    return await _bookDataSource.getBook(bookId);
  }

  @override
  Future<List<BookEntity?>> getBooks() async {
    return await _bookDataSource.getBooks();
  }

  @override
  Future<void> removeBook(String bookId) async {
    await _bookDataSource.removeBook(bookId);
  }
  
  @override
  Future<BookEntity?> updateBook(String bookId, BookEntity updatedBook) {
    return _bookDataSource.updateBook(bookId, updatedBook);
  }
}
