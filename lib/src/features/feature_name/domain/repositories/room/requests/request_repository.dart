import 'package:course_app/src/features/feature_name/domain/entities/room/requests/request_entity.dart';

abstract class RequestRepository {
  // helper function
  Future<bool> isInRequest(String roomId, String userId);

  // CRUD operations
  // Create
  Future<void> addRequest(RequestEntity request);
  // Read
  Future<RequestEntity> getRequest(String roomId, String userId);
  Future<List<RequestEntity>> getRoomRequests(String roomId);
  // Remove
  Future<void> removeRequest(String roomId, String userId); // uses RemoveRequest by teacherId
}
