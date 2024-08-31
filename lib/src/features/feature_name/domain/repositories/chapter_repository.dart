import 'package:course_app/src/features/feature_name/domain/entities/book/chapter_entity.dart';

abstract class ChapterRepository {
  Future<void> addChapter(ChapterEntity chapter);
  Future<ChapterEntity> getChapter(String chapterId);
  Future<void> updateChapter(String chapterId);
  Future<void> removeChapter(String chapterId);
}
