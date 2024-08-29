import 'package:course_app/src/features/feature_name/domain/entities/book/section_entity.dart';

abstract class SectionRepo {
  Future<SectionEntity> addSection(SectionEntity section);
  Future<SectionEntity> removeSection(SectionEntity section);
  Future<SectionEntity> updateSection(SectionEntity section);
  Future<SectionEntity> getSection();
}