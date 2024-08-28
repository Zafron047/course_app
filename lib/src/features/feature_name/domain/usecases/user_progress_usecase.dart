import 'package:course_app/src/features/feature_name/domain/entities/book.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_progress.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_progress_repository.dart';

class UserProgressUsecase {
  final UserProgressRepository _userProgressRepository;

  UserProgressUsecase(this._userProgressRepository);

  Future<void> addBook(BookEntity book) async {
    if (!await _userProgressRepository.hasBook(book.bookId)) {
      await _userProgressRepository.addBook(book.bookId);
    }
  }

  Future<UserProgressEntity> getUserProgress(String userId, String bookId) async {
    return await _userProgressRepository.getUserProgress(userId, bookId);
  }
}
