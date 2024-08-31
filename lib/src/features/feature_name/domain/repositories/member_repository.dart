import 'package:course_app/src/features/feature_name/domain/entities/room/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user/user_role_entity.dart';

abstract class MemberRepository {
  Future<bool> isTeacher(String roomId, String userId);
  Future<MemberEntity> addMember(String roomId, String userId);
  Future<void> removeMember(String roomId, String teacherId);
  Future<void> changeRole(String roomId, String userId, UserRole newRole);
  Future<MemberEntity> getMember(String memberId);
  Future<List<MemberEntity>> getMembers(String roomId);
}
