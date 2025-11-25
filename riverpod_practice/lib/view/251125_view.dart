import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/view_model/251125_view_model.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 16),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final state = ref.watch(counterProvider);
                  final value = state.counter.value;

                  return Text(
                    '$value',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 64,
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return FloatingActionButton(
            onPressed: () {
              final viewModel = ref.read(counterProvider.notifier);
              viewModel.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}