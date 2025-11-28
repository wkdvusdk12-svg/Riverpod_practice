import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int basePrice = 8000;
  bool extraShrimp = false;
  bool extraCheese = false;
  int quantity = 1;

  int get totalPrice {
    int topping = 0;
    if (extraShrimp) {
      topping += 3000;
    }
    if (extraCheese) {
      topping += 2000;
    }
    return (basePrice + topping) * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Cart', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home, color: Colors.white),
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
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 160,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
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
          ),
          SizedBox(height: 8),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '토핑 추가',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: extraShrimp,
                        activeColor: Colors.redAccent,
                        onChanged: (value) {
                          setState(() {
                            extraShrimp = value!;
                          });
                        },
                      ),
                      Text('새우 추가'),
                      SizedBox(width: 200),
                      Text('3,000원'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: extraCheese,
                        activeColor: Colors.redAccent,
                        onChanged: (value) {
                          setState(() {
                            extraCheese = value!;
                          });
                        },
                      ),
                      Text('치즈 추가'),
                      SizedBox(width: 200),
                      Text('2,000원'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '주문수량',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 200),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 16),
                Text('$quantity'),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.add),
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
              '${totalPrice}원 담기',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}