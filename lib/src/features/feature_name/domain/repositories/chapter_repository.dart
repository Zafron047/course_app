import 'package:course_app/src/features/feature_name/domain/entities/chapter.dart';

abstract class ChapterRepository {
  Future<ChapterEntity> addChapter(ChapterEntity chapter);
  Future<ChapterEntity> removeChapter(ChapterEntity chapter);
  Future<ChapterEntity> getChapter(ChapterEntity chapter);
}