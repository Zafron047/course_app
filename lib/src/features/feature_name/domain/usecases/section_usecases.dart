import 'package:course_app/src/features/feature_name/domain/entities/book/section_entity.dart';
import 'package:course_app/src/features/feature_name/domain/repositories/section_repository.dart';

class SectionUsecases {
  final SectionRepository sectionRepository;

  SectionUsecases(this.sectionRepository);

  Future<void> addSection(SectionEntity section) async {
    return await sectionRepository.addSection(section);
  }

  Future<void> removeSection(String sectionId) async {
    return await sectionRepository.removeSection(sectionId);
  }

  Future<void> updateSection(String sectionId) async {
    return await sectionRepository.updateSection(sectionId);
  }

  Future<void> getSection(String sectionId) async {
    return await sectionRepository.getSection(sectionId);
  }
}
