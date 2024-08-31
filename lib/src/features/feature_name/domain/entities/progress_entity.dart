
import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';

class ProgressEntity {
  final String userId;
  final Map<String, BookEntity> books;

  ProgressEntity({
    required this.userId,
    this.books = const {},
  });
}