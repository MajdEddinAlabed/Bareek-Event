import 'package:flutter/material.dart';
import 'package:event_app/utils/drawer.dart';

class NewEventScreen extends StatefulWidget {
  static String name = '/new_event_screen';
  final String title;
  const NewEventScreen({super.key, required this.title});

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [
          TitleInputField(
            title: "Event Title",
            textHint: "Enter Title Here",
          ),
          TimePicker(),
        ],
      ),
    );
  }
}

class TitleInputField extends StatelessWidget {
  final String title;
  final String textHint;
  const TitleInputField(
      {super.key, required this.title, required this.textHint});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 350,
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: textHint,
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Pick date",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 160,
                height: 45,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Pick start date",
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time,
                    );
                    if (newTime == null) return;
                    setState(() => time = newTime);
                  },
                  onChanged: (value) => '${time.hour}:${time.minute}',
                ),
              ),
              SizedBox(
                width: 160,
                height: 45,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Pick end date",
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: time,
                    );
                    if (newTime == null) return;
                    setState(() => time = newTime);
                  },
                  onChanged: (value) => '${time.hour}:${time.minute}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
