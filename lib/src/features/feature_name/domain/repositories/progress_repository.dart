import 'package:course_app/src/features/feature_name/domain/entities/book/chapters/chapter_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/homework/homework_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/progress/book_progress_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/progress_entity.dart';

abstract class ProgressRepository {
  Future<void> updateProgress(String studentId, String bookId, String chapterId,
      Map<int, bool> sectionRange); // Update userProgress as per review
  Future<ProgressEntity> undoUpdate(
      String homeWorkId, String userProgressId);
  Future<bool> hasBook(String bookId); // check if userProgress has the book
  Future<BookProgressEntity> addBook(String bookId); // add book to userProgress
  Future<ChapterEntity> addChapters(String bookId);
  Future<void> addSections(String bookId);
  Future<bool> isRangeValid(
      HomeWorkEntity
          homeWork); // check if user has the book? add book. Then check if the range is valid?
  Future<ProgressEntity> getUserProgress(String userId, String bookId);
}
