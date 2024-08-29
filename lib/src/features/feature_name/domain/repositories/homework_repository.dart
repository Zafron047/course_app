import 'package:course_app/src/features/feature_name/domain/entities/homework/homework_entity.dart';

abstract class HomeWorkRepo {
  Future<void> submitHomeWork(
      HomeWorkEntity homeWork); // Submit homework to Homeworks collection
  // Future<void> notifyTeacher(String roomId);
  Future<void> acceptReview(String homeWorkId,
      String reviewerId); // update reviewerId in Homework Document
  Future<bool> isReviewer(
      String homeWorkId, String teacherId); // check if teacher is reviewer
  Future<void> finishReview(
      String
          homeWorkId); // update isReviewed and reviewedDate in Homework Document.
  Future<void> undoReview(
      String homeWorkId,
      String
          progressId); // update isReviewed reviewedDate in Homework Document and set range as false in UserProgress
  // Future<void> notifyStudent(String homeWorkId);
  Future<HomeWorkEntity> getHomeWork(String homeWorkId); // get homework by id
}
