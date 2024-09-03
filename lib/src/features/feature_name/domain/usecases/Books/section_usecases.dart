import 'package:course_app/src/features/feature_name/domain/repositories/section_repository.dart';

class SectionUsecases {
  final SectionRepository sectionRepository;

  SectionUsecases(this.sectionRepository);

  Future<void> addSection(int sectionNo, bool isMemorrized) async {
    return await sectionRepository.addSection(sectionNo, isMemorrized);
  }

  Future<void> getSection(int sectionNo) async {
    return await sectionRepository.getSection(sectionNo);
  }

  Future<void> updateSection(int sectionNo) async {
    return await sectionRepository.updateSection(sectionNo);
  }

  Future<void> removeSection(int sectionNo) async {
    return await sectionRepository.removeSection(sectionNo);
  }

  Future<void> getSectionRange(Map<int, bool> sectionRange) async {
    return await sectionRepository.getSectionRange(sectionRange);
  }

  Future<void> updateSectionRange(Map<int, bool> sectionRange) async {
    return await sectionRepository.updateSectionRange(sectionRange);
  }
}
