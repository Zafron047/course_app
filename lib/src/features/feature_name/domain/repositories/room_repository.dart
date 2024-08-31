import 'package:course_app/src/features/feature_name/domain/entities/room/room_entity.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user_presence.dart';
import 'package:course_app/src/features/feature_name/domain/entities/room/members/member_role_entity.dart';

abstract class RoomRepository {
  Future<bool> isTeacher(String roomId, String teacherId);
  Future<void> setRoomName(String roomId, String newRroomName);
  Future<void> privacyHandler(String roomId);

  // helper functions
  Future<UserPresence> getUserPresence(
      String roomId,
      String
          userField); // helper method to be defined in the data repository temporary defined in domain repository
  Future<bool> isStudent(String roomId, String userId);
  Future<bool> isMember(String roomId, String userId);
  Future<bool> isInvited(String roomId, String userMail);
  Future<bool> requested(String roomId, String userId);
  Future<bool> isBlocked(String roomId, String userId);

  // members subcollection
  Future<void> addMember(String roomId, String userId);
  Future<void> removeMember(String roomId, String teacherId);
  Future<void> changeRole(String roomId, String userId, MemberRole newRole);

  // invites subcollection
  Future<void> sendInvite(String roomId, String userMail);
  Future<void> removeInvite(String roomId, String userMail);

  // requests subcollection
  Future<void> approveRequest(String roomId, String userId);
  Future<void> addRequest(String roomId, String userId);
  Future<void> removeRequest(String roomId, String userId);

  // blockList subcollection
  Future<void> addToBlockList(String roomId, String userId);
  Future<void> removeFromBlockList(String roomId, String userId);

  // bookList List
  Future<void> addToBookList(String roomId, String bookId);
  Future<void> removeFromBookList(String roomId, String bookId);

  // room Collection
  Future<void> createRoom(String roomId, String roomName, String creatorId);

  // helper method
  Future<bool> validateRemoveRoom(String roomId, String teacherId);
  Future<void> removeRoom(String roomId);
  Future<RoomEntity> getRoom(String roomId);
}
