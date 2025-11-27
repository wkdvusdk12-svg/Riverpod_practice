class Alarm {
  String time;
  String period;
  String label;
  bool isOn;

  Alarm(this.time, this.period, this.label, this.isOn);

  Alarm copyWith({String? time, String? period, String? label, bool? isOn}) {
    return Alarm(this.time, this.period, this.label, this.isOn);
  }
}
