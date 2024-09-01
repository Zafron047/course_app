import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';

abstract class RoomBookListRepository {
  // create
  Future<BookEntity> addToBookList(String roomId, String bookId);
  // read
  Future<BookEntity> getBook(String bookId);
  Future<List<BookEntity>> getBookList(String roomId);
  // delete
  Future<void> removeFromBookList(String roomId, String bookId);
}
