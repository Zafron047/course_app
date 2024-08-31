import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

class RequestEntity {
  final String roomId;
  final String requestId;
  final UserEntity user;

  RequestEntity({
    required this.roomId,
    required this.requestId,
    required this.user,
  });
}

// Redundant entity class. User entity can be passed directly to the request entity.