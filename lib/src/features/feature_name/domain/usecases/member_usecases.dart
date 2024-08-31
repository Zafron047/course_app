import 'package:course_app/src/features/feature_name/domain/entities/room/member_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/member_repository.dart';

class MemberUsecases {
  final MemberRepository _memberRepository;
  MemberUsecases(this._memberRepository);

  Future<void> addMember(MemberEntity member) async {
    return await _memberRepository.addMember(member);
  }

  Future<void> removeMember(String memberId) async {
    return await _memberRepository.removeMember(memberId);
  }

  Future<void> updateMember(String memberId) async {
    return await _memberRepository.updateMember(memberId);
  }

  Future<MemberEntity> getMember(String memberId) async {
    return await _memberRepository.getMember(memberId);
  }

  Future<List<MemberEntity>> getMembers(String roomId) async {
    return await _memberRepository.getMembers(roomId);
  }
}
