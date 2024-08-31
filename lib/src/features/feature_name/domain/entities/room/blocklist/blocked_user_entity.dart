import 'package:course_app/src/features/feature_name/domain/entities/user/user_entity.dart';

class BlockedUserEntity {
  final String roomId;
  final UserEntity user;

  BlockedUserEntity({required this.roomId, required this.user});
}

// THIS ENTITY FILE IS REDUNDANT AND UNUSED. IT IS NOT REFERENCED ANYWHERE IN THE PROJECT.
// BLOCKLIST WILL POPULATE WITH USERENTITY OBJECTS. NO NEED FOR A SEPARATE ENTITY.