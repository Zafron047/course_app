import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/room/members/member_repository.dart';

class MemberUsecases {
  final MemberRepository _memberRepository;
  MemberUsecases(this._memberRepository);

  Future<MemberEntity> addMember(MemberEntity member) async {
    return await _memberRepository.addMember(member.roomId, member.user.userId);
  }

  Future<void> removeMember(MemberEntity member) async {
    return await _memberRepository.removeMember(member.roomId, member.user.userId);
  }

  Future<void> changeRoleAsTeacher(String roomId, String teacherId, String studentId) async {
    if(!await _memberRepository.isTeacher(roomId, teacherId)) {
      throw Exception('You are not a teacher');
    }
    if(!await _memberRepository.isStudent(roomId, studentId)) {
      throw Exception('Invalid student');
    }
    return await _memberRepository.updateMember(roomId, studentId, MemberRole.teacher);
  }

  Future<void> changeRoleAsStudent(String roomId, String teacherId) async {
    if(!await _memberRepository.isTeacher(roomId, teacherId)) {
      throw Exception('You are not a teacher');
    }
    return await _memberRepository.updateMember(roomId, teacherId, MemberRole.student);
  }

  Future<MemberEntity> getMember(String roomId, String userId) async {
    return await _memberRepository.getMember(roomId, userId);
  }

  Future<List<MemberEntity>> getMembers(String roomId) async {
    return await _memberRepository.getMembers(roomId);
  }
}
