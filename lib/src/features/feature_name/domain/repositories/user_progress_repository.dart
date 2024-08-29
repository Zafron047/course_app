import 'package:course_app/src/features/feature_name/domain/entities/homework/homework_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_progress_entity.dart';

abstract class UserProgressRepository {
  Future<void> updateProgress(String studentId, String bookId, String chapterId,
      Map<int, bool> sectionRange); // Update userProgress as per review
  Future<UserProgressEntity> undoUpdate(
      String homeWorkId, String userProgressId);
  Future<bool> hasBook(String bookId); // check if userProgress has the book
  Future<void> addBook(String bookId); // add book to userProgress
  Future<void> addChapters(String bookId);
  Future<void> addSections(String bookId);
  Future<bool> isRangeValid(
      HomeWorkEntity
          homeWork); // check if user has the book? add book. Then check if the range is valid?
  Future<UserProgressEntity> getUserProgress(String userId, String bookId);
}
