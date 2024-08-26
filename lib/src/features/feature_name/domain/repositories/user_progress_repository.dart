import 'package:course_app/src/features/feature_name/domain/entities/home_work.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_progress.dart';

abstract class UserProgressRepo {
  Future<UserProgressEntity> update(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<UserProgressEntity> undoUpdate(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<bool> bookExist(UserProgressEntity userProgress);
  Future<void> copyBook(HomeWorkEntity homeWork, UserProgressEntity userProgress);
  Future<UserProgressEntity> getUserProgress(UserProgressEntity userProgress);
}
