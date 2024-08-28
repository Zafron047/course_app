import 'package:course_app/src/features/feature_name/domain/entities/home_work.dart';

abstract class HomeWorkRepo {
  Future<void> submitHomeWork(HomeWorkEntity homeWork);
  // Future<void> notifyTeacher(String roomId);
  Future<void> acceptReview(String homeWorkId, String reviewerId);
  Future<bool> isReviewer(String homeWorkId, String teacherId);
  Future<void> finishReview(String homeWorkId, String progressId);
  Future<void> undoReview(String homeWorkId, String progressId);
  // Future<void> notifyStudent(String homeWorkId);
  Future<HomeWorkEntity> getHomeWork(String homeWorkId);
}
