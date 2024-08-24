class RoomEntity {
  final String roomId;
  final String roomName;
  final bool isPrivate;
  final bool exists;

  RoomEntity({
    required this.roomId,
    required this.roomName,
    this.isPrivate = false,
    this.exists = true,
  });
}
