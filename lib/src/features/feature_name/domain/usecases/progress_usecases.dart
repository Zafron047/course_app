import 'package:course_app/src/features/feature_name/domain/entities/book/book_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/progress_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/progress_repository.dart';

class UserProgressUsecase {
  final ProgressRepository _userProgressRepository;

  UserProgressUsecase(this._userProgressRepository);

  Future<void> addBook(BookEntity book) async {
    if (!await _userProgressRepository.hasBook(book.bookId)) {
      await _userProgressRepository.addBook(book.bookId);
    }
  }

  Future<ProgressEntity> getUserProgress(String userId, String bookId) async {
    return await _userProgressRepository.getUserProgress(userId, bookId);
  }
}
