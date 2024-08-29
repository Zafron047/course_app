import 'package:course_app/src/features/feature_name/domain/entities/book/section_entity.dart';

abstract class SectionRepository {
  Future<void> addSection(SectionEntity section);
  Future<void> removeSection(String sectionId);
  Future<void> updateSection(String sectionId);
  Future<void> getSection(String sectionId);
}