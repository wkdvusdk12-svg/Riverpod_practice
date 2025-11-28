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
    return AlarmPageState(
      alarms: [
        Alarm('7:00', 'AM', 'Alarm', false),
        Alarm('8:30', 'AM', 'Alarm', false),
        Alarm('8:00', 'PM', 'Alarm', false),
      ],
    );
  }

  void alarmdata(int index, bool isOn) {
    var alarm = state.alarms[index];

    if (isOn == true) {
      alarm.isOn = true;
    } else {
      alarm.isOn = false;
    }

    state = state.copyWith(alarm: state.alarms[index].copyWith(isOn: isOn));

   
  }
}

final AlarmViewProvider = NotifierProvider<AlarmViewModel, AlarmPageState>(
  () => AlarmViewModel(),
);
