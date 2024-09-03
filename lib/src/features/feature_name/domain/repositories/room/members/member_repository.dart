import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';

abstract class MemberRepository {
  // helper functions
  Future<bool> isStudent(String roomId, String userId);
  Future<bool> isTeacher(String roomId, String teacherId);
  Future<bool> isMember(String roomId, String userId);

  // Create
  Future<MemberEntity> addMember(String roomId, String userId);
  // Read
  Future<MemberEntity> getMember(String roomId, String userId);
  Future<List<MemberEntity>> getMembers(String roomId);
  Future<bool> isOnlyTeacherLeft(String roomId);
  // Update
  Future<void> updateMember(String roomId, String userId, MemberRole currentRole);
  // Delete
  Future<void> removeMember(String roomId, String userId);
}
