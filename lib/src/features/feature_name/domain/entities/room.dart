import 'package:course_app/src/features/feature_name/domain/entities/user_role.dart';

class RoomEntity {
  final String roomId;
  final String roomName;
  bool isPrivate = false;
  bool exists = true;
  Map<String, UserRole> members = {};
  Map<String, String> requests = {};
  List<String> invites = [];
  Map<String, String> blockList = {};
  Map<String, dynamic> bookList = {};

  RoomEntity({
    required this.roomId,
    required this.roomName,
    required this.members,
  });
}
