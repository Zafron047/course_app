import 'package:course_app/src/features/feature_name/domain/entities/book/chapters/chapter_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/homeworks/homework_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_progress/user_progress_entity.dart';

abstract class UserProgressRepository {
  // create
  Future<UserProgressEntity> addBookinProgress(HomeWorkEntity homeWork);
  Future<ChapterEntity> addChapterInProgress(HomeWorkEntity homeWork);
  // read
  Future<UserProgressEntity> getBookProgress(String userId, String bookId); // get progress by bookId
  Future<UserProgressEntity> getUserProgress(String userId); // get progress by userId
  Future<UserProgressEntity> getRoomProgress(String roomId); // get progress of all students in a room
  // update
  Future<void> updateProgress(HomeWorkEntity homeWork);
  Future<UserProgressEntity> undoUpdate(HomeWorkEntity homeWork);
  
  // helper read
  Future<bool> hasBook(String studentId, String bookId);
  Future<bool> isRangeValid(HomeWorkEntity homeWork);
}
