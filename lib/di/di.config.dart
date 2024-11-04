// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/example/application/bloc/example_cubit.dart' as _i235;
import '../features/example/domain/repository/example_repository.dart' as _i207;
import '../features/example/domain/use_case/change_count_use_case.dart'
    as _i469;
import '../features/example/domain/use_case/watch_count_use_case.dart' as _i144;
import '../features/example/infrastructure/repository/example_repository.dart'
    as _i443;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i207.ExampleRepository>(
    () => _i443.ExampleRepositoryImpl(),
    dispose: (i) => i.dispose(),
  );
  gh.lazySingleton<_i469.ChangeCountUseCase>(
      () => _i469.ChangeCountUseCase(gh<_i207.ExampleRepository>()));
  gh.lazySingleton<_i144.WatchCountUseCase>(
      () => _i144.WatchCountUseCase(gh<_i207.ExampleRepository>()));
  gh.factory<_i235.ExampleCubit>(() => _i235.ExampleCubit(
        gh<_i144.WatchCountUseCase>(),
        gh<_i469.ChangeCountUseCase>(),
      ));
  return getIt;
}
