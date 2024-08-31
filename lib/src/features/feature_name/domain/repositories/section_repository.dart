import 'package:course_app/src/features/feature_name/domain/entities/book/section_entity.dart';

abstract class SectionRepository {
  Future<void> addSection(SectionEntity section); // C
  Future<void> getSection(String sectionId); // R
  Future<void> updateSection(String sectionId); // U
  Future<void> removeSection(String sectionId); // D
  Future<void> getSectionRange(Map<int, bool> sectionRange); // R
  Future<void> updateSectionRange(Map<int, bool> sectionRange); // U
}
