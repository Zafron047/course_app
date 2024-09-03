import 'package:course_app/src/features/feature_name/domain/entities/room/homeworks/homework_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/homeworks/homework_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/progress/user_book_progress/user_book_progress_repository.dart';

class HomeworkUsecases {
  final HomeWorkRepo _homeWorkRepository;
  final UserBookProgressRepository _userProgressRepository;
  final MemberRepository _roomRepository;

  HomeworkUsecases(this._homeWorkRepository, this._userProgressRepository,
      this._roomRepository);

  Future<void> submitHomeWork(HomeWorkEntity homeWork) async {
    if (!await _roomRepository.isStudent(homeWork.roomId, homeWork.studentId) &&
        !await _userProgressRepository.isRangeValid(homeWork)) {
      throw Exception('Invalid student');
    }
    await _homeWorkRepository.createHomeWork(homeWork);
  }

  Future<void> acceptReview(String homeWorkId, String teacherId) async {
    if (!await _roomRepository.isTeacher(homeWorkId, teacherId)) {
      // check if teacher is in the room
      throw Exception('Invalid teacher');
    }
    await _homeWorkRepository.addReviewer(homeWorkId, teacherId);
  }

  Future<void> finishReview(String homeWorkId, String teacherId) async {
    HomeWorkEntity homeWork = await _homeWorkRepository.getHomeWork(homeWorkId);
    String? reviewerId = homeWork.reviewerId;

    if (reviewerId != null && teacherId == reviewerId) {
      await _userProgressRepository.updateProgress(homeWork);
      await _homeWorkRepository.finishReview(homeWorkId);
    }
  }

  Future<void> undoReview(
      String homeWorkId, String teacherId, String progressId) async {
    if (!await _homeWorkRepository.isReviewer(homeWorkId, teacherId)) {
      throw Exception('Invalid reviewer');
    }
    await _homeWorkRepository.undoReview(homeWorkId, progressId);
  }

  Future<HomeWorkEntity> getHomeWork(String homeWorkId) async {
    return await _homeWorkRepository.getHomeWork(homeWorkId);
  }
}
