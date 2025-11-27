import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/251127_model.dart';

class AlarmPageState {
  final List<Alarm> alarms;

  AlarmPageState({required this.alarms});

  AlarmPageState copyWith({Alarm? alarm}) {
    return AlarmPageState(alarms: alarms ?? this.alarms);
  }
}

class AlarmViewModel extends Notifier<AlarmPageState> {
  @override
  AlarmPageState build() {
    return AlarmPageState(alarms: [
      Alarm('7:00', 'AM', 'Alarm', false),
      Alarm('8:30', 'AM', 'Alarm', false),
      Alarm('8:00', 'PM', 'Alarm', false),
      ]);
  }

  void alarmdaata(int index, bool isOn) {
    var currentValue = state.alarm.time;
    var newisOn = currentValue;
    if (isOn) {
      Alarm.isOn = true;
    }
    state = state.copyWith(alarm: state.alarm.copyWith(isOn: newisOn));
  }
}

final calculatorViewProvider = NotifierProvider<AlarmViewModel, AlarmPageState>(
  () => AlarmViewModel(),
);
