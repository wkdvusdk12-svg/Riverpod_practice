import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/251126_model.dart';

class CalculatorPageState {
  final Calculator calculator;

  CalculatorPageState({required this.calculator});

  CalculatorPageState copyWith({Calculator? calculator}) {
    return CalculatorPageState(calculator: calculator ?? this.calculator);
  }
}

class CalculatorViewModel extends Notifier<CalculatorPageState> {
  @override
  CalculatorPageState build() {
    return CalculatorPageState(calculator: Calculator(0));
  }

  void calculation(String type) {
    var currentValue = state.calculator.answer;
    var newAnswer = currentValue;
    switch (type) {
      case 'ADD':
        newAnswer++;
        break;
      case 'MINUS':
        newAnswer--;
        break;
      case 'INIT':
        newAnswer = 0;
        break;
    }
    state = state.copyWith(
      calculator: state.calculator.copyWith(answer: newAnswer),
    );
  }
}

final calculatorViewProvider =
    NotifierProvider<CalculatorViewModel, CalculatorPageState>(
      () => CalculatorViewModel(),
    );
