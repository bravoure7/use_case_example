import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:use_case_example/features/example/presentation/screen/example_screen.dart';

import 'di/di.dart';

Future<void> main() async {
  await configureDependencies(Environment.dev);
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'UseCase Example',
        theme: ThemeData.light(),
        initialRoute: ExampleScreen.routeName,
        routes: {
          ExampleScreen.routeName: (_) => const ExampleScreen(),
        },
      );
}
