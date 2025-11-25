import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/251125_model.dart';

class CounterPageState {
  final Counter counter;

  CounterPageState({required this.counter});

  CounterPageState copyWith({Counter? counter}) {
    return CounterPageState(counter: counter ?? this.counter);
  }
}

class CounterViewModel extends Notifier<CounterPageState> {
  @override
  CounterPageState build() {
    return CounterPageState(counter: Counter(0));
  }

  void increment() {
    final current = state.counter.value;
    final updatedCounter = state.counter.copyWith(value: current + 1);
    state = state.copyWith(counter: updatedCounter);
  }
}

final counterProvider = NotifierProvider<CounterViewModel, CounterPageState>(
  () => CounterViewModel(),
);
