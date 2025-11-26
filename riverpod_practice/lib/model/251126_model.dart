class Calculator{
  int answer;
  Calculator(this.answer);

  Calculator copyWith({int? answer}) => Calculator(answer ?? this.answer);

}