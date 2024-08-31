import 'package:course_app/src/features/feature_name/domain/entities/homework/homework_entity.dart';
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
    if (!await _roomRepository.isStudent(homeWork.roomId, homeWork.studentId) &&
        !await _userProgressRepository.isRangeValid(homeWork)) {
      throw Exception('Invalid student');
    }
    await _homeWorkRepository.submitHomeWork(homeWork);
  }

  Future<void> acceptReview(String homeWorkId, String teacherId) async {
    if (!await _roomRepository.isTeacher(homeWorkId, teacherId)) {
      // check if teacher is in the room
      throw Exception('Invalid teacher');
    }
    await _homeWorkRepository.acceptReview(homeWorkId, teacherId);
  }

  Future<void> finishReview(
      String homeWorkId, String teacherId) async {
    HomeWorkEntity homeWork = await _homeWorkRepository.getHomeWork(homeWorkId);
    String? reviewerId = homeWork.reviewerId;

    if (reviewerId != null && teacherId == reviewerId) {
      await _userProgressRepository.updateProgress(homeWork.studentId,
          homeWork.bookId, homeWork.chapterId, homeWork.sectionRange);
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
