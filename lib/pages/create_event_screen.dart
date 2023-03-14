import 'package:flutter/material.dart';

enum EventVisibility { public, private }

class CreateEventScreen extends StatefulWidget {
  static String name = '/create_event_screen';

  const CreateEventScreen({super.key});
  @override
  CreateEventScreenState createState() => CreateEventScreenState();
}

class CreateEventScreenState extends State<CreateEventScreen> {
  EventVisibility? _visibility = EventVisibility.public;
  String? selectedEventAddress;
  String? description;
  late String eventName;
  late String eventLocation;
  late DateTime _eventDate = DateTime.now();
  final _eventNameFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final List<String> eventAddress = ['Syria', 'Egypt', 'Japan', 'Turkey'];
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Event'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      //Select Event Title & Address.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 2.5,
                                bottom: 2.5,
                              ),
                              child: TextFormField(
                                focusNode: _eventNameFocusNode,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Event Title',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the event name';
                                  }
                                  return null;
                                },
                                onSaved: (value) => eventName = value!,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.only(left: 10),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Event Address',
                                ),
                                value: selectedEventAddress,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedEventAddress = newValue;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please enter the event Address';
                                  }
                                  return null;
                                },
                                items: eventAddress
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Select Day for the Event.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Event Date',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              _eventDate == null
                                  ? 'Choose Date'
                                  : '${_eventDate.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                color: _eventDate == null ? null : Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: _eventDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                              );
                              if (date != null) {
                                setState(() => _eventDate = date);
                              }
                            },
                          ),
                        ],
                      ),
                      //Select Start & End Time for the Event.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Start time.
                          Column(
                            children: [
                              //Button to call start timePicker.
                              ElevatedButton(
                                onPressed: () => _selectStartTime(context),
                                child: const Text('Select start time'),
                              ),
                              //Show selected start time.
                              Text('Start time: ${_startTime.format(context)}'),
                            ],
                          ),
                          //End Time.
                          Column(
                            children: [
                              //Button to call end timePicker.
                              ElevatedButton(
                                onPressed: () => _selectEndTime(context),
                                child: const Text('Select end time'),
                              ),
                              //Show selected end time.
                              Text('End time: ${_endTime.format(context)}'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Event Description Field
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          maxLines: null,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            border: InputBorder.none,
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a description';
                          //   }
                          //   return null;
                          // },
                          onSaved: (value) {
                            description = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      //Two buttons to select if The event Private or Public
                      Column(
                        children: <Widget>[
                          Row(
                            children: const [
                              Text(
                                'Event Visibility',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio<EventVisibility>(
                                value: EventVisibility.public,
                                groupValue: _visibility,
                                onChanged: (EventVisibility? value) {
                                  setState(() {
                                    _visibility = value;
                                  });
                                },
                              ),
                              const Text('Public'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio<EventVisibility>(
                                value: EventVisibility.private,
                                groupValue: _visibility,
                                onChanged: (EventVisibility? value) {
                                  setState(() {
                                    _visibility = value;
                                  });
                                },
                              ),
                              const Text('Private'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Confirm button.
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Only pick time after current time function.
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
        // Display an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Please select a time after the current time')),
        );
      } else {
        setState(() {
          _startTime = picked;
        });
      }
    }
  }

  //Only pick time after start time function.
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
      helpText: 'Select end time',
    );
    if (picked != null) {
      setState(() {
        _endTime = picked;
      });
    }
  }
}
