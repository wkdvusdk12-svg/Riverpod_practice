import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/view_model/251127_view_model.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  String time = '7:00';
  String period = 'AM';
  String label = 'Alarm';
  List<bool> alarmOn = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Edit', style: TextStyle(color: Colors.orangeAccent)),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            const Text(
              'Alarm',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Divider(thickness: 0.5, color: Colors.white54, height: 1),
            SizedBox(height: 8),
            Alarmlist(0, '7:00', 'AM', 'Alarm'),
            SizedBox(height: 8),
            Alarmlist(1, '8:30', 'AM', 'Alarm'),
            SizedBox(height: 8),
            Alarmlist(2, '8:00', 'PM', 'Alarm'),
          ],
        ),
      ),
    );
  }

  Widget Alarmlist(int index, String time, String period, String label) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(AlarmViewProvider);
        bool isOn = state.alarms[index].isOn;
        Color textColor = isOn ? Colors.white : Colors.white54;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            time,
                            style: TextStyle(fontSize: 48, color: textColor),
                          ),
                          SizedBox(width: 4),
                          Text(
                            period,
                            style: TextStyle(fontSize: 20, color: textColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        label,
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ],
                  ),
                ),

                CupertinoSwitch(
                  value: state.alarms[index].isOn,
                  onChanged: (value) {
                    final viewModel = ref.read(AlarmViewProvider.notifier);
                    viewModel.alarmdata(index, value);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(thickness: 0.5, color: Colors.white54, height: 1),
          ],
        );
      },
    );
  }
}
