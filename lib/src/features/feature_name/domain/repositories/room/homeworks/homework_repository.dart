import 'package:course_app/src/features/feature_name/domain/entities/room/homeworks/homework_entity.dart';

abstract class HomeWorkRepo {
  // create
  Future<void> createHomeWork(HomeWorkEntity homeWork);
  // update
  Future<void> addReviewer(String homeWorkId, String reviewerId);
  // get
  Future<bool> isReviewer(String homeWorkId, String teacherId);
  // update
  Future<void> finishReview(String homeWorkId); // update isReviewed and reviewedDate
  // update
  Future<void> undoReview(String homeWorkId, String progressId); // update isReviewed and reviewedDate
  // delete
  Future<void> deleteHomeWork(String userId, String homeWorkId);
  // get
  Future<HomeWorkEntity> getHomeWork(String userId, String roomId);
  Future<List<HomeWorkEntity>> getHomeWorks(String studentId);
}
