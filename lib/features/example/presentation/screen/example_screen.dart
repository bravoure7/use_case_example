import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_case_example/di/di.dart';
import 'package:use_case_example/features/example/application/bloc/example_cubit.dart';

typedef _Cubit = ExampleCubit;
typedef _State = ExampleState;

final class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  static const routeName = "/example-screen";

  @override
  Widget build(BuildContext context) => BlocProvider<_Cubit>(
        create: (_) => getIt<_Cubit>(),
        child: const _ExampleScreenView(),
      );
}

final class _ExampleScreenView extends StatelessWidget {
  const _ExampleScreenView();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("UseCase Test"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocSelector<_Cubit, _State, int>(
                selector: (state) => state.count,
                builder: (context, count) => Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: context.cubit.decrement,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: context.cubit.increment,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}

extension _BuildContextExtension on BuildContext {
  _Cubit get cubit => read<_Cubit>();
}
