class UserPresenceRoleEntity {
  final bool isMember;
  final bool isStudent;
  final bool isTeacher;
  final bool isInvited;
  final bool isRequested;
  final bool isBlocked;

  UserPresenceRoleEntity({
    required this.isMember,
    required this.isStudent,
    required this.isTeacher,
    required this.isInvited,
    required this.isRequested,
    required this.isBlocked,
  });
}
