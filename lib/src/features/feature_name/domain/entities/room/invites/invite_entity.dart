class InviteEntity {
  final String roomId;
  final String email;

  InviteEntity({required this.roomId, required this.email});
}

// collection roomID -> sub collection Invites{email}