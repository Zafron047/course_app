class RoomEntity {
  final String roomId;
  final String roomName;
  bool isPrivate;
  bool exists;
  List<String> bookList;

  RoomEntity({
    required this.roomId,
    required this.roomName,
    this.isPrivate = false, // Default to false
    this.exists = true, // Default to true
    this.bookList = const [], // bookList collection
  });
}
