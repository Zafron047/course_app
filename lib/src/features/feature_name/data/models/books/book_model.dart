import 'package:course_app/src/features/feature_name/domain/entities/books/book_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart'; // This is the file where the generated code will be written

@JsonSerializable()
class BookModel {
  final String title;
  final String author;

  BookModel({
    required this.title,
    required this.author,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  factory BookModel.fromEntity(BookEntity bookEntity) {
    return BookModel(
        title: bookEntity.title,
        author: bookEntity.author);
  }

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
  BookEntity toEntity() {
    return BookEntity(title: title, author: author);
  }
}
