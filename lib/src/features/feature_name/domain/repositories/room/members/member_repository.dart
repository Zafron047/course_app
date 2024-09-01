import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';

abstract class MemberRepository {
  // helper functions
  Future<bool> isStudent(String roomId, String userId);
  Future<bool> isTeacher(String roomId, String teacherId);
  Future<bool> isMember(String roomId, String userId);

  // members subcollection
  Future<MemberEntity> addMember(String roomId, String userId); // Create
  Future<MemberEntity> getMember(String userId); // Read member with role.
  Future<MemberRole> updateMember(
      String roomId, String userId, MemberRole newRole); // Update member role
  Future<void> removeMember(String roomId, String teacherId); // Delete

  Future<List<MemberEntity>> getMembers(String roomId); // Read all members
}
