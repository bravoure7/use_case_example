part of 'example_cubit.dart';

final class ExampleState extends Equatable {
  const ExampleState({required this.count});

  factory ExampleState.initial() => const ExampleState(count: 0);

  final int count;

  @override
  List<Object> get props => [count];

  ExampleState copyWith({
    int? count,
  }) =>
      ExampleState(
        count: count ?? this.count,
      );
}
