import '../../../repositories/room/members/member_repository.dart';
import '../../../repositories/room/room_booklist/booklist_repository.dart';

class RoomBookListUsecases {
  final RoomBookListRepository _bookListRepository;
  final MemberRepository _memberRepository;

  RoomBookListUsecases(this._bookListRepository, this._memberRepository);

  // bookList collection uses bookList and member repository
  Future<void> addToBookList(
      String roomId, String teacherId, String bookId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      _bookListRepository.addToBookList(roomId, bookId);
    }
    throw Exception('Invalid access');
  }

  Future<void> removeFromBookList(
      String roomId, String teacherId, String bookId) async {
    if (await _memberRepository.isTeacher(roomId, teacherId)) {
      return _bookListRepository.removeFromBookList(roomId, bookId);
    }
    throw Exception('Invalid access');
  }

  Future<void> getBook(String roomId, String bookId) async {
    _bookListRepository.getBook(roomId, bookId);
  }

  Future<void> getBookList(String roomId) async {
    _bookListRepository.getBookList(roomId);
  }
}

