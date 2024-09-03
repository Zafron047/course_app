import 'package:course_app/src/features/feature_name/domain/entities/book/chapters/chapter_entity.dart';

abstract class ChapterRepository {
  Future<void> addChapter(ChapterEntity chapter);
  Future<ChapterEntity> getChapter(String chapterId);
  Future<ChapterEntity> updateChapter(String chapterId);
  Future<void> removeChapter(String chapterId);
  Future<ChapterEntity> updateSections(
      String bookId, String chapterId, Map<int, bool> sections);
}
