import '../../../entities/books/chapters/chapter_entity.dart';

abstract class ChapterRepository {
  Future<void> addChapter(ChapterEntity chapter);
  Future<ChapterEntity> getChapter(String chapterId);
  Future<ChapterEntity> updateChapter(String chapterId);
  Future<void> removeChapter(String chapterId);
  Future<ChapterEntity> updateSections(
      String bookId, String chapterId, Map<int, bool> sections);
}
