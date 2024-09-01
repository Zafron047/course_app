import 'package:course_app/src/features/feature_name/domain/entities/book/chapters/chapter_entity.dart';

class BookEntity {
  final String bookId;
  final String title;
  final String author;
  final Map<int, ChapterEntity> chapters;

  BookEntity({
    required this.bookId,
    required this.title,
    required this.author,
    this.chapters = const {},
  });
}
