import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:use_case_example/features/example/domain/entity/example_error.dart';
import 'package:use_case_example/features/example/domain/repository/example_repository.dart';

@LazySingleton(as: ExampleRepository)
final class ExampleRepositoryImpl implements ExampleRepository {
  ExampleRepositoryImpl();

  final _countSubject = BehaviorSubject<int>.seeded(0);

  @override
  Stream<int> get watchCount => _countSubject.stream;

  @override
  void incrementCount() {
    final newValue = _count + 1;
    if (newValue > 5) {
      throw const ExampleErrorChangeCount(
        message: "Значение не может быть больше 5",
      );
    }
    _countSubject.add(newValue);
  }

  @override
  void decrementCount() {
    final newValue = _count - 1;
    if (newValue < 0) {
      throw const ExampleErrorChangeCount(
        message: "Значение не может быть меньше 0",
      );
    }
    _countSubject.add(newValue);
  }

  @override
  @disposeMethod
  void dispose() {
    _countSubject.close();
  }

  int get _count => _countSubject.value;
}
