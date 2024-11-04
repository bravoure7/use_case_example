import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:use_case_example/features/core/domain/extension/result_extension.dart';
import 'package:use_case_example/features/core/domain/use_case/models/use_case_params.dart';
import 'package:use_case_example/features/example/domain/use_case/change_count_use_case.dart';
import 'package:use_case_example/features/example/domain/use_case/watch_count_use_case.dart';

part 'example_state.dart';

@injectable
final class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit(
    this._watchCountUseCase,
    this._changeCountUseCase,
  ) : super(ExampleState.initial()) {
    _watchCount();
  }

  final WatchCountUseCase _watchCountUseCase;
  final ChangeCountUseCase _changeCountUseCase;

  StreamSubscription<int>? _countSubscription;

  void increment() => _changeCountUseCase(const ChangeCountUseCaseIncrement())
      .onError(addError);

  void decrement() => _changeCountUseCase(const ChangeCountUseCaseDecrement())
      .onError(addError);

  @override
  Future<void> close() {
    _countSubscription?.cancel();
    return super.close();
  }

  void _watchCount() => _watchCountUseCase(const NoParams()).handle(
        onSuccess: (countStream) {
          _countSubscription?.cancel();
          _countSubscription = countStream.listen(
            (count) => emit(state.copyWith(count: count)),
          );
        },
        onError: addError,
      );
}
