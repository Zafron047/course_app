import 'package:course_app/src/features/feature_name/domain/entities/room/homeworks/homework_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_progress/chapter_progress/chapter_progress_entity.dart';

abstract class ChapterProgressRepository {
  // CRUD operations

  // create
  Future<ChapterProgressEntity> createChapterToProgress(
      String userId, String bookId, String chapterId);
  // read
  Future<Map<int, bool>> getChapterFromProgress(
      String userId, String bookId, String chapterId);
  // update
  Future<void> updateChapterInProgress(
      String userId, String bookId, String chapterId, Map<int, bool> sections);

  // helper get
  Future<bool> isRangeValid(HomeWorkEntity homeWork);
}
