import 'package:course_app/src/features/feature_name/domain/repositories/Progress/user_book_progress/chapter_progress/chapter_progress_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/Progress/user_book_progress/user_book_progress_repository.dart';

import '../../entities/user_book_progress/chapter_progress/chapter_progress_entity.dart';
import '../../entities/user_book_progress/user_progress_entity.dart';

class UserProgressUsecase {
  final UserBookProgressRepository _userProgressRepository;
  final ChapterProgressRepository _chapterProgressRepository;

  UserProgressUsecase(
      this._userProgressRepository, this._chapterProgressRepository);

  Future<UserProgressEntity> addBookProgress(
      String userId, String bookId) async {
    return await _userProgressRepository.addBookinProgress(userId, bookId);
  }

  Future<ChapterProgressEntity?> addChapterProgress(
      String userId, String bookId, String chapterId) async {
    return await _chapterProgressRepository.createChapterProgress(userId, bookId, chapterId);
  }

  Future<UserProgressEntity> getBookProgress(
      String userId, String bookId) async {
    return await _userProgressRepository.getBookProgress(userId, bookId);
  }

  Future<ChapterProgressEntity?> getChapterProgress(
      String userId, String bookId, String chapterId) async {
    return await _chapterProgressRepository.getChapterProgress(userId, bookId, chapterId);
  }
}
