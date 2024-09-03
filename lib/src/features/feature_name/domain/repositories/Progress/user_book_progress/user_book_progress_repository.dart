import '../../../entities/room/homeworks/homework_entity.dart';
import '../../../entities/user_book_progress/user_progress_entity.dart';

abstract class UserBookProgressRepository {
  // create
  Future<UserProgressEntity> addBookinProgress(String userId, String bookId);
  // read
  Future<UserProgressEntity> getBookProgress(
      String userId, String bookId); // get progress by user's bookId
  Future<UserProgressEntity> getUserProgress(
      String userId); // get all book progress by userId
  Future<UserProgressEntity> getRoomProgress(
      String roomId); // get progress of all students in a room by room bookList
  // update
  Future<void> updateProgress(HomeWorkEntity homeWork);
  Future<UserProgressEntity> undoUpdate(HomeWorkEntity homeWork);

  // helper read
  Future<bool> hasBook(String studentId, String bookTitle);
  Future<bool> isRangeValid(HomeWorkEntity homeWork);
}
