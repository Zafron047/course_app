import 'package:course_app/src/features/feature_name/domain/entities/home_work.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_progress.dart';

abstract class HomeWorkRepo {
  Future<bool> isStudentValid(HomeWorkEntity homeWork, RoomEntity room);
  Future<Map<int, bool>> isRangeValid(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<Map<int, bool>> setSectionRange(HomeWorkEntity homeWork);
  Future<void> isHomeWorkValid(HomeWorkEntity homeWork, RoomEntity room, UserProgressEntity userProgress);
  Future<void> submitHomeWork(HomeWorkEntity homeWork, RoomEntity room, UserProgressEntity userProgress);
  Future<void> notifyTeacher(HomeWorkEntity homeWork, RoomEntity room);
  Future<bool> isTeacher(HomeWorkEntity homeWork, RoomEntity room);
  Future<void> acceptReview(HomeWorkEntity homeWork);
  Future<void> finishReview(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<void> undoReview(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<void> notifyStudent(HomeWorkEntity homeWork);
  Future<HomeWorkEntity> getHomeWork(HomeWorkEntity homeWork);
}
