import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_entity.dart';
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

  Future<void> updateMember(MemberEntity member) async {
    return await _memberRepository.changeRole(member.roomId, member.user.userId, member.role);
  }

  Future<MemberEntity> getMember(String memberId) async {
    return await _memberRepository.getMember(memberId);
  }

  Future<List<MemberEntity>> getMembers(String roomId) async {
    return await _memberRepository.getMembers(roomId);
  }
}
