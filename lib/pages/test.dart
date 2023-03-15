import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  static String name = '/test';
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late DateTime _eventDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 210, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Button to set day.
                    ElevatedButton(
                      onPressed: () => _selectDate(),
                      child: const Text('Select date'),
                    ),
                    Text("Day: ${_eventDate.month}/${_eventDate.day}/${_eventDate.year}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Button to call start timePicker.
                    ElevatedButton(
                      onPressed: () => _selectStartTime(context),
                      child: const Text('Select start time'),
                    ),
                    Text('Start time: ${_startTime.format(context)}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Button to call end timePicker.
                    ElevatedButton(
                      onPressed: () => _selectEndTime(),
                      child: const Text('Select end time'),
                    ),
                    Text('End time: ${_endTime.format(context)}'),
                  ],
                ),
              ],
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     //Buttons.
            //     Column(
            //       children: [
            //         //Button to set day.
            //         ElevatedButton(
            //           onPressed: () => _selectDate(),
            //           child: const Text('Select date'),
            //         ),
            //         //Button to call start timePicker.
            //         ElevatedButton(
            //           onPressed: () => _selectStartTime(context),
            //           child: const Text('Select start time'),
            //         ),
            //         //Button to call end timePicker.
            //         ElevatedButton(
            //           onPressed: () => _selectEndTime(),
            //           child: const Text('Select end time'),
            //         ),
            //       ],
            //     ),
            //     //Text.
            //     Column(
            //       children: [
            //         Text('Day: ${_eventDate.day}'),
            //         Text('Start time: ${_startTime.format(context)}'),
            //         Text('End time: ${_endTime.format(context)}'),
            //       ],
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
  //Only pick date after from now and after.
  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _eventDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() => _eventDate = date);
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
      helpText: 'Select start time',
    );
    if (picked != null) {
      final now = DateTime.now();
      final selectedDateTime =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      final isSameDay = now.day == selectedDateTime.day;
      if (isSameDay && selectedDateTime.isBefore(now)) {
        // The selected time is on the same day as the current time and is before the current time
        _scaffoldMessengerKey.currentState!.showSnackBar(
          const SnackBar(
            content: Text('Please select a time after the current time'),
          ),
        );
      } else {
        setState(() {
          _startTime = picked;
        });
      }
    }
  }

  //Only pick time after start time function.
  Future<void> _selectEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: _scaffoldMessengerKey.currentContext!,
      initialTime: _endTime,
      helpText: 'Select end time',
      builder: (BuildContext context, Widget? child) {
        // Only allow times after the start time to be selected
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );
    if (picked != null &&
        (picked.hour > _startTime.hour ||
            (picked.hour == _startTime.hour &&
                picked.minute > _startTime.minute))) {
      setState(() {
        _endTime = picked;
      });
    } else if (picked != null &&
        (picked.hour < _startTime.hour ||
            (picked.hour == _startTime.hour &&
                picked.minute <= _startTime.minute))) {
      // The selected end time is before or equal to the start time
      _scaffoldMessengerKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Please select an end time after the start time'),
        ),
      );
    }
  }
}
