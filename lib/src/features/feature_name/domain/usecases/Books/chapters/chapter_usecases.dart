import '../../../entities/books/chapters/chapter_entity.dart';
import '../../../repositories/books/chapter/chapter_repository.dart';

class ChapterUsecases {
  final ChapterRepository chapterRepository;

  ChapterUsecases(this.chapterRepository);

  Future<void> addChapter(ChapterEntity chapter) async {
    return await chapterRepository.addChapter(chapter);
  }

  Future<void> removeChapter(String chapterId) async {
    return await chapterRepository.removeChapter(chapterId);
  }

  Future<ChapterEntity> getChapter(String chapterId) async {
    return await chapterRepository.getChapter(chapterId);
  }

  Future<ChapterEntity> editChapterDetail(String chapterId) async {
    return await chapterRepository.updateChapter(chapterId);
  }

  Future<ChapterEntity> editChapterDetailSections(
      String bookId, String chapterId, Map<int, bool> sections) async {
    return await chapterRepository.updateSections(bookId, chapterId, sections);
  }
}
