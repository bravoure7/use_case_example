import 'package:use_case_example/features/core/domain/models/base_error.dart';
import 'package:use_case_example/features/core/domain/models/result.dart';

extension ResultExtension<T> on Result<T> {
  T? get getOrNull =>
      switch (this) {
        Success<T>(data: final data) => data,
        Failure() => null,
      };

  T getOrElse(T Function() orElse) =>
      switch (this) {
        Success<T>(data: final data) => data,
        Failure() => orElse(),
      };

  T getOrDefault(T defaultValue) =>
      switch (this) {
        Success<T>(data: final data) => data,
        Failure() => defaultValue,
      };

  Result<R> map<R>(R Function(T) transform) =>
      switch (this) {
        Success<T>(data: final data) => Result.success(transform(data)),
        Failure(error: final error) => Result.failure(error),
      };

  Result<R> flatMap<R>(Result<R> Function(T) transform) =>
      switch (this) {
        Success<T>(data: final data) => transform(data),
        Failure(error: final error) => Result.failure(error),
      };

  R fold<R>({
    required R Function(T) onSuccess,
    required R Function(BaseError) onError,
  }) =>
      switch (this) {
        Success<T>(data: final data) => onSuccess(data),
        Failure(error: final error) => onError(error),
      };

  void _handle({
    required void Function(T) onSuccess,
    required void Function(BaseError) onError,
  }) =>
      switch (this) {
        Success<T>(data: final data) => onSuccess(data),
        Failure(error: final error) => onError(error),
      };
}

extension AsyncResultExtension<T> on AsyncResult<T> {
  Future<void> handle({
    required void Function(T) onSuccess,
    required void Function(BaseError) onError,
  }) async =>
      (await this)._handle(onSuccess: onSuccess, onError: onError);

  Future<void> onSuccess(void Function(T) onSuccess) async =>
      (await this)._handle(onSuccess: onSuccess, onError: (_) {});

  Future<void> onError(void Function(BaseError) onError) async =>
      (await this)._handle(onSuccess: (_) {}, onError: onError);
}
