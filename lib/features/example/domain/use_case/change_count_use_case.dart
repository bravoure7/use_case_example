import 'package:injectable/injectable.dart';
import 'package:use_case_example/features/core/domain/use_case/models/use_case.dart';
import 'package:use_case_example/features/core/domain/use_case/models/use_case_params.dart';
import 'package:use_case_example/features/example/domain/repository/example_repository.dart';

@lazySingleton
final class ChangeCountUseCase extends VoidUseCase<ChangeCountUseCaseParam> {
  const ChangeCountUseCase(this._exampleRepository);

  final ExampleRepository _exampleRepository;

  @override
  Future<void> execute(ChangeCountUseCaseParam params) async =>
      switch (params) {
        ChangeCountUseCaseIncrement() => _exampleRepository.incrementCount(),
        ChangeCountUseCaseDecrement() => _exampleRepository.decrementCount(),
      };
}

sealed class ChangeCountUseCaseParam extends UseCaseParams {
  const ChangeCountUseCaseParam();

  @override
  List<Object?> get props => const [];
}

final class ChangeCountUseCaseIncrement extends ChangeCountUseCaseParam {
  const ChangeCountUseCaseIncrement();
}

final class ChangeCountUseCaseDecrement extends ChangeCountUseCaseParam {
  const ChangeCountUseCaseDecrement();
}
