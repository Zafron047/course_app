import 'package:course_app/src/features/feature_name/domain/entities/user_progress.dart';

abstract class UserProgressRepository {
  Future<UserProgressEntity> updateProgress(
      String homeWorkId, String userProgressId);
  Future<UserProgressEntity> undoUpdate(
      String homeWorkId, String userProgressId);
  Future<bool> hasBook(String bookId);
  Future<void> addBook(String bookId);
  Future<void> addChapters(String bookId);
  Future<void> addSections(String bookId);
  Future<UserProgressEntity> getUserProgress(String userId, String bookId);
}
