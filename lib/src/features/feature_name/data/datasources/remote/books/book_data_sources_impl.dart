import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/src/features/feature_name/data/models/books/book_model.dart';

import '../../../../domain/entities/books/book_entity.dart';
import 'book_data_sources.dart';

class BookDataSourcesImpl implements BookDataSources {
  final FirebaseFirestore db;
  BookDataSourcesImpl(this.db);

  // Create
  @override
  Future<void> addBook(BookEntity book) async {
    try {
      Map<String, dynamic> bookJson = BookModel.fromEntity(book).toJson();
      await db.collection('books').add(bookJson);
    } catch (e) {
      print('Error adding book to Firestore: $e');
      rethrow;
    }
  }

  Future<BookEntity> getBook(String bookId) async {
    throw UnimplementedError();
  }

  // Future<List<BookEntity>> getBooks() async {
  //   throw UnimplementedError();
  // }
  // Update
  Future<BookEntity> updateBook(String bookId) async {
    throw UnimplementedError();
  }

  // Delete
  Future<void> removeBook(String bookId) async {
    throw UnimplementedError();
  }
}
