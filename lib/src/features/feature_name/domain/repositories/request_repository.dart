import 'package:course_app/src/features/feature_name/domain/entities/room/requests/request_entity.dart';

abstract class RequestRepository {
  Future<void> addRequest(RequestEntity request);
  Future<void> getRoomRequests(String roomId, String teacherId);
  Future<void> removeRequest(String requestId); // uses RemoveRequest by teacherId
}