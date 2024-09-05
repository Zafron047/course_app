// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      bookId: json['bookId'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
    };
