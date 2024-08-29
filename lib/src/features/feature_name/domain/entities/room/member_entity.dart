import 'package:course_app/src/features/feature_name/domain/entities/user/user_role_entity.dart';

class MemberEntity {
  final String roomId;
  final String userId;
  final String userName;
  final String email;
  final UserRole role;

  MemberEntity({
    required this.roomId,
    required this.userId,
    required this.userName,
    required this.email,
    required this.role,
  });
}
