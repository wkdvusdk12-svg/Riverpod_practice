class Cart {
  int basePrice = 8000;
  bool extraShrimp = false;
  bool extraCheese = false;
  int quantity = 1;

  Cart(this.basePrice, this.extraShrimp, this.extraCheese, this.quantity);

  Cart copyWith({
    int? basePrice,
    bool? extraShrimp,
    bool? extraCheese,
    int? quantity,
  }) {
    return Cart(
      this.basePrice,
      this.extraShrimp,
      this.extraCheese,
      this.quantity,
    );
  }
}
