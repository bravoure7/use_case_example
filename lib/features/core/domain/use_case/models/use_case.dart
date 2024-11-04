import 'package:flutter/foundation.dart';
import 'package:use_case_example/features/core/domain/models/base_error.dart';
import 'package:use_case_example/features/core/domain/models/result.dart';
import 'package:use_case_example/features/core/domain/use_case/models/use_case_params.dart';

/// Base class for all use cases in the application.
/// [Response] - type of data returned by the use case
/// [Params] - type of parameters required by the use case
abstract base class UseCase<Response, Params extends UseCaseParams> {
  const UseCase();

  /// Internal execution method to be implemented by concrete use cases
  @protected
  Future<Response> execute(Params params);

  /// Executes the use case and returns wrapped result
  ///
  /// [params] - Input parameters for the use case
  /// Returns [Result<Response>] containing either success or failure
  AsyncResult<Response> call(Params params) async {
    try {
      final response = await execute(params);
      return Result.success(response);
    } on BaseError catch (error) {
      return Result.failure(error);
    } on Exception catch (e, stackTrace) {
      return Result.failure(
        UnexpectedError(message: e.toString(), stackTrace: stackTrace),
      );
    }
  }
}

abstract base class SimpleUseCase<Response>
    extends UseCase<Response, NoParams> {
  const SimpleUseCase();
}

abstract base class VoidUseCase<Params extends UseCaseParams>
    extends UseCase<void, Params> {
  const VoidUseCase();
}
