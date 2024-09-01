
import 'package:course_app/src/features/feature_name/domain/entities/progress/book_progress_entity.dart';

class ProgressEntity {
  final String userId;
  final Map<String, BookProgressEntity> books;

  ProgressEntity({
    required this.userId,
    this.books = const {},
  });
}