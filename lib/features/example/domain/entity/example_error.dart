import 'package:use_case_example/features/core/domain/models/base_error.dart';

sealed class ExampleError extends BaseError {
  const ExampleError({super.message, super.stackTrace});
}

final class ExampleErrorChangeCount extends ExampleError {
  const ExampleErrorChangeCount({super.message, super.stackTrace});
}
