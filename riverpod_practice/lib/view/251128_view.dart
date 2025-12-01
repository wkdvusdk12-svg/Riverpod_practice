import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class CartViewModel extends Notifier<CartState> {
  @override
  CartState build() => CartState();

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

final cartProvider = NotifierProvider<CartViewModel, CartState>(
  () => CartViewModel(),
);

void main() {
  runApp(const ProviderScope(child: CartApp()));
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const CartPage());
  }
}

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);

    final viewModel = ref.read(cartProvider.notifier);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Cart', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://media.istockphoto.com/id/1174657282/ko/%EC%82%AC%EC%A7%84/%ED%8C%8C%EC%8A%A4%ED%83%80-%ED%9A%8C%EC%83%89-%EB%8F%8C-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B2%80%EC%9D%80-%EA%B7%B8%EB%A6%87%EC%97%90-%ED%86%A0%EB%A7%88%ED%86%A0-%EC%86%8C%EC%8A%A4-%EC%8A%A4%ED%8C%8C%EA%B2%8C%ED%8B%B0-%EB%A7%A8-%EC%9C%84-%EB%B3%B4%EA%B8%B0.jpg?s=612x612&w=0&k=20&c=fcqnNxwB7EJW-GGp5stVZtmZBUtMyr8oCNMfP05YjEI=',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '로제 파스타',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('8,000원', style: TextStyle(fontSize: 24)),
                SizedBox(height: 8),
                Text(
                  '통통한 새우살과 로제 소스의 만남!',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '토핑 추가',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: state.extraShrimp,
                      activeColor: Colors.redAccent,
                      onChanged: (value) {
                        viewModel.toggleShrimp();
                      },
                    ),
                    const Text('새우 추가'),
                    const Spacer(),
                    const Text('3,000원'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: state.extraCheese,
                      activeColor: Colors.redAccent,
                      onChanged: (value) {
                        viewModel.toggleCheese();
                      },
                    ),
                    const Text('치즈 추가'),
                    const Spacer(),
                    const Text('2,000원'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text(
                  '주문수량',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                const SizedBox(width: 16),
                Text('${state.quantity}', style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    viewModel.incrementQuantity();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Text(
              '${state.totalPrice}원 담기',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
