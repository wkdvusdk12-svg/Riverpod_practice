import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/view_model/251126_view_model.dart';

class CalculatorRiverpodView extends StatelessWidget {
  const CalculatorRiverpodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'RiverPod Example App',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              "Simple Counter",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            SizedBox(height: 80),
            Center(
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final state = ref.watch(calculatorViewProvider);
                  return Text(
                    '${state.calculator.answer}',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  );
                },
              ),
            ),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculationButton('ADD', Icons.add, 'Add'),
                SizedBox(width: 16),
                calculationButton('MINUS', Icons.remove, 'Minus'),
              ],
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [calculationButton('INIT', Icons.refresh, 'Refresh')],
            ),
          ],
        ),
      ),
    );
  }

  Widget calculationButton(String type, IconData icon, String title) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return InkWell(
          onTap: () {
            final viewModel = ref.read(calculatorViewProvider.notifier);
            viewModel.calculation(type);
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
