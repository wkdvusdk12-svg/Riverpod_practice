import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/251128_model.dart';

class CartPageState {
  final Cart cart;

  CartPageState({required this.cart});

  CartPageState copyWith({Cart? cart}) {
    return CartPageState(cart: cart ?? this.cart);
  }
}

class CartViewModel extends Notifier<CartPageState> {
  @override
  CartPageState build() {
    return CartPageState(cart: Cart(0));
  }

  void cartTotal(
    int topping,
    bool extraShrimp,
    bool extraCheese,
    int basePrice,
    int quantity,
  ) {
    int totalPrice() {
      int topping = 0;

      if (extraShrimp) {
        topping += 3000;
      }

      if (extraCheese) {
        topping += 2000;
      }

      return (basePrice + topping) * quantity;
    }

    state = state.copyWith(cart: state.cart.copyWith());
  }
}

final cartViewProvider = NotifierProvider<CartViewModel, CartPageState>(
  () => CartViewModel(),
);
