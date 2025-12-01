class CartState {
  final bool extraShrimp;
  final bool extraCheese;
  final int quantity;

  CartState({
    this.extraShrimp = false,
    this.extraCheese = false,
    this.quantity = 1,
  });

  CartState copyWith({bool? extraShrimp, bool? extraCheese, int? quantity}) {
    return CartState(
      extraShrimp: extraShrimp ?? this.extraShrimp,
      extraCheese: extraCheese ?? this.extraCheese,
      quantity: quantity ?? this.quantity,
    );
  }

  int get totalPrice {
    int basePrice = 8000;
    int topping = 0;
    if (extraShrimp) topping += 3000;
    if (extraCheese) topping += 2000;
    return (basePrice + topping) * quantity;
  }
}
