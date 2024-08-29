import 'package:course_app/src/features/feature_name/domain/entities/book/chapter_entity.dart';

abstract class ChapterRepository {
  Future<ChapterEntity> addChapter(ChapterEntity chapter);
  Future<ChapterEntity> removeChapter(ChapterEntity chapter);
  Future<ChapterEntity> getChapter(ChapterEntity chapter);
}