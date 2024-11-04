import 'package:equatable/equatable.dart';
import 'package:use_case_example/features/core/domain/models/base_error.dart';

typedef AsyncResult<T> = Future<Result<T>>;

sealed class Result<T> extends Equatable {
  const Result();

  factory Result.success(T data) => Success._(data);

  factory Result.failure(BaseError error) => Failure._(error);

  @override
  bool? get stringify => true;
}

final class Success<T> extends Result<T> {
  const Success._(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

final class Failure<T> extends Result<T> {
  const Failure._(this.error);

  final BaseError error;

  @override
  List<Object?> get props => [error];
}
