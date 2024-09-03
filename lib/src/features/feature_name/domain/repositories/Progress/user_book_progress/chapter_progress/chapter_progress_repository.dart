import '../../../../entities/room/homeworks/homework_entity.dart';
import '../../../../entities/user_book_progress/chapter_progress/chapter_progress_entity.dart';

abstract class ChapterProgressRepository {
  // create
  Future<ChapterProgressEntity> createChapterProgress(
      String userId, String bookId, String chapterId);
  // read
  Future<ChapterProgressEntity> getChapterProgress(
      String userId, String bookId, String chapterId);
  Future<Map<int, bool>> getChapterSections(
      String userId, String bookId, String chapterId, Map<int, bool> sections);
  // update
  Future<void> updateChapterProgress(
      String userId, String bookId, String chapterId, Map<int, bool> sections);

  // helper get
  Future<bool> isRangeValid(HomeWorkEntity homeWork);
}
