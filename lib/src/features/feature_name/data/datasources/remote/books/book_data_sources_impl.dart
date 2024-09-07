import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/src/features/feature_name/data/models/books/book_model.dart';

import '../../../../domain/entities/books/book_entity.dart';
import 'book_data_sources.dart';

class BookDataSourcesImpl implements BookDataSources {
  final FirebaseFirestore _db;
  BookDataSourcesImpl(this._db);

  // Create
  @override
  Future<void> addBook(BookEntity book) async {
    try {
      Map<String, dynamic> bookJson = BookModel.fromEntity(book).toJson();
      await _db.collection('books').add(bookJson);
    } catch (e) {
      // ignore: avoid_print
      print('Attention Printed error: $e');
      rethrow;
    }
  }

  @override
  Future<BookEntity?> getBook(String bookId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>>? bookSnapShot =
          await _db.collection('books').doc(bookId).get();
      Map<String, dynamic>? bookData = bookSnapShot.data();
      if (bookData == null) {
        BookEntity? bookEntity = BookModel.fromJson(bookData!).toEntity();
        return bookEntity;
      }
      return null;
    } catch (e) {
      print('Attention Printed error: $e');
      rethrow;
    }
  }

  @override
  Future<List<BookEntity?>> getBooks() async {
    try {
      QuerySnapshot<Map<String, dynamic>?> booksSnapshot =
          await _db.collection('books').get();
      if (booksSnapshot.docs.isNotEmpty) {
        List<BookEntity> books = booksSnapshot.docs
            .map((doc) => BookModel.fromJson(doc.data()!).toEntity())
            .toList();
        return books;
      }
      return [];
    } catch (e) {
      print('Attention Printed error: $e');
      rethrow;
    }
  }

  // Update
  @override
  Future<BookEntity?> updateBook(String bookId, BookEntity updatedBook) async {
    try {
      Map<String, dynamic> bookJson =
          BookModel.fromEntity(updatedBook).toJson();
      await _db.collection('books').doc(bookId).update(bookJson);

      DocumentSnapshot<Map<String, dynamic>> bookSnapShot =
          await _db.collection('bookId').doc(bookId).get();
      if (bookSnapShot.data() == null) return null;

      BookEntity book = BookModel.fromJson(bookSnapShot.data()!).toEntity();
      return book;
    } catch (e) {
      print('Attention Printed error: $e');
      rethrow;
    }
  }

  // Delete
  @override
  Future<void> removeBook(String bookId) async {
    try {
      final bookSnapShot = await _db.collection('books').doc(bookId).delete();
      return bookSnapShot;
    } catch (e) {
      print('Attention Printed error: $e');
      rethrow;
    }
  }
}
