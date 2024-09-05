
import '../../../entities/books/book_entity.dart';

abstract class RoomBookListRepository {
  // create
  Future<BookEntity> addToBookList(String roomId, String bookId);
  // read
  Future<BookEntity> getBook(String roomId, String bookId);
  Future<List<BookEntity>> getBookList(String roomId);
  // delete
  Future<void> removeFromBookList(String roomId, String bookId);
}
