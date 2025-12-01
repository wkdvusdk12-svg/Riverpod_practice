import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/251128_model.dart';

class CartViewModel extends Notifier<CartState> {
  
  @override
  CartState build() {
    return CartState();
  }

  void toggleShrimp() {
    state = state.copyWith(extraShrimp: !state.extraShrimp);
  }

  void toggleCheese() {
    state = state.copyWith(extraCheese: !state.extraCheese);
  }

  void incrementQuantity() {
    state = state.copyWith(quantity: state.quantity + 1);
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      state = state.copyWith(quantity: state.quantity - 1);
    }
  }
}

final cartProvider = NotifierProvider<CartViewModel, CartState>(() {
  return CartViewModel();
});