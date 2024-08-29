import 'package:course_app/src/features/feature_name/domain/entities/user_role.dart';

class Member {
  final String roomId;
  final String userId;
  final String userName;
  final String email;
  final UserRole role;

  Member({
    required this.roomId,
    required this.userId,
    required this.userName,
    required this.email,
    required this.role,
  });
}
