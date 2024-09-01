import 'package:course_app/src/features/feature_name/domain/entities/progress/chapter_progress/chapter_progress_entity.dart';

class BookProgressEntity {
  int ttlChapters;
  double bookProgress;
  final String bookId;
  final String title;
  final String author;
  final Map<int, ChapterProgressEntity> chapters;

  BookProgressEntity({
    this.ttlChapters = 0,
    this.bookProgress = 0.0,
    required this.bookId,
    required this.title,
    required this.author,
    this.chapters = const {},
  });
}
