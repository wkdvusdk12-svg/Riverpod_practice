class Counter {
  final int value;

  const Counter(this.value);

  Counter copyWith({int? value}) => Counter(value ?? this.value);
}
