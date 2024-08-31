import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';

abstract class MemberRepository {
  Future<bool> isTeacher(String roomId, String userId);
  Future<MemberEntity> addMember(String roomId, String userId);
  Future<MemberEntity> getMember(String memberId);
  Future<void> changeRole(String roomId, String userId, MemberRole newRole);
  Future<void> removeMember(String roomId, String userId);
  Future<List<MemberEntity>> getMembers(String roomId);
}
