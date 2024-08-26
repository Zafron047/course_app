import 'package:course_app/src/features/feature_name/domain/entities/room.dart';
import 'package:course_app/src/features/feature_name/domain/entities/user.dart';

abstract class RoomRepository {
  Future<RoomEntity> setRoomName(RoomEntity room);
  Future<RoomEntity> privacyHandler(RoomEntity room);
  Future<RoomEntity> inviteMembers(RoomEntity room);
  Future<RoomEntity> handleRequest(RoomEntity room);
  Future<RoomEntity> removeMember(RoomEntity room);
  Future<RoomEntity> changeRole(User user, RoomEntity room);
  Future<RoomEntity> handleBookList(RoomEntity room, User user);
  Future<RoomEntity> removeRoom(RoomEntity room);
  Future<RoomEntity> getRoom(RoomEntity room);
}