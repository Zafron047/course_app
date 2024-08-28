import 'package:course_app/src/features/feature_name/domain/entities/home_work.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/homework_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/user_progress_repository.dart';

class HomeworkUsecase {
  final HomeWorkRepo _homeWorkRepository;
  final UserProgressRepository _userProgressRepository;
  final RoomRepository _roomRepository;

  HomeworkUsecase(this._homeWorkRepository, this._userProgressRepository,
      this._roomRepository);

  Future<void> submitHomeWork(HomeWorkEntity homeWork) async {
    if (!await _roomRepository.isStudent(homeWork.roomId, homeWork.studentId)) {
      throw Exception('Invalid student');
    }

    String bookId = homeWork.bookId;
    if (!await _userProgressRepository.hasBook(bookId)) {
      await _userProgressRepository.addBook(bookId);
    }
    await _homeWorkRepository.submitHomeWork(homeWork);
  }

  Future<void> acceptReview(String homeWorkId, String teacherId) async {
    if (!await _roomRepository.isTeacher(homeWorkId, teacherId)) {
      throw Exception('Invalid teacher');
    }
    await _homeWorkRepository.acceptReview(homeWorkId, teacherId);
  }

  Future<void> finishReview(
      String homeWorkId, String teacherId, String progressId) async {
    HomeWorkEntity homeWork = await _homeWorkRepository.getHomeWork(homeWorkId);
    String? reviewerId = homeWork.reviewerId;
    String userProgressId = '${homeWork.studentId}_${homeWork.bookId}';

    if (reviewerId != null && teacherId == reviewerId) {
      await _userProgressRepository.updateProgress(homeWorkId, userProgressId);
      await _homeWorkRepository.finishReview(homeWorkId, progressId);
    }
  }

  Future<void> undoReview(
      String homeWorkId, String teacherId, String progressId) async {
    if (!await _homeWorkRepository.isReviewer(homeWorkId, teacherId)) {
      throw Exception('Invalid teacher');
    }
    await _homeWorkRepository.undoReview(homeWorkId, progressId);
  }

  Future<HomeWorkEntity> getHomeWork(String homeWorkId) async {
    return await _homeWorkRepository.getHomeWork(homeWorkId);
  }
}
