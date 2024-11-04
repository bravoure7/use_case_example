import 'package:equatable/equatable.dart';

/// Base error class for all domain-specific errors
abstract base class BaseError extends Equatable implements Exception {
  const BaseError({this.message, this.stackTrace});

  final String? message;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [message, stackTrace];

  @override
  bool? get stringify => true;

  @override
  String toString() => message ?? "";
}

/// Represents unexpected errors during use case execution
final class UnexpectedError extends BaseError {
  const UnexpectedError({super.message, super.stackTrace});
}
