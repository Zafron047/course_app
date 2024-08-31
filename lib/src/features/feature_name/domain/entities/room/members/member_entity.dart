import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

class MemberEntity {
  final String roomId;
  final UserEntity user; // Reference to the user
  final MemberRole role;

  MemberEntity({
    required this.roomId,
    required this.user,
    required this.role,
  });
}
