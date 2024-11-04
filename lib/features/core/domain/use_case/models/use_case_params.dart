import 'package:equatable/equatable.dart';

abstract base class UseCaseParams extends Equatable {
  const UseCaseParams();

  @override
  bool? get stringify => true;
}

/// Represents empty parameters for use cases that don't require any parameters
final class NoParams extends UseCaseParams {
  const NoParams();

  @override
  List<Object?> get props => const [];
}
