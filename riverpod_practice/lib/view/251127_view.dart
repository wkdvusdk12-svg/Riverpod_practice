import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/view_model/251127_view_model.dart';

class AlarmRiverpodView extends StatelessWidget {
  const AlarmRiverpodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Edit',
            style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.orangeAccent),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Alarm",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(thickness: 0.5, color: Colors.white54, height: 1),
          Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final state = ref.watch(alarmViewProvider);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlarmData('7:00', 'AM', 'Alarm', true),
                    SizedBox(width: 16),
                    AlarmData('8:30', 'AM', 'Alarm', true),
                    SizedBox(width: 16),
                    AlarmData('8:00', 'PM', 'Alarm', true),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget AlarmData(String time, String period, String label, bool isOn) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return InkWell(
          onTap: () {
            final viewModel = ref.read(alarmViewProvider.notifier);
            viewModel.calculation(time);
          },
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    SizedBox(width: 4),
                    Text(
                      period,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    CupertinoSwitch(value: isOn, onChanged: (value) {}),
                  ],
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Divider(thickness: 0.5, color: Colors.white54, height: 1),
              ],
            ),
          ),
        );
      },
    );
  }
}
