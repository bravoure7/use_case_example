import 'package:use_case_example/features/core/domain/models/base_error.dart';

mixin UseCaseLogger {
  void logError(BaseError error) {}

  void logSuccess<T>(T data) {}
}
