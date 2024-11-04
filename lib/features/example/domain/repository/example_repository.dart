abstract interface class ExampleRepository {
  Stream<int> get watchCount;

  void incrementCount();

  void decrementCount();

  void dispose();
}
