// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  static String name = '/testFromGhatGPT';

  const CreateEventPage({super.key});
  @override
  CreateEventPageState createState() => CreateEventPageState();
}

class CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();

  // Variables to store the input values
  late String eventName;
  late String eventLocation;
  late DateTime _eventDate = DateTime.now();
  late TimeOfDay _eventTime = TimeOfDay.now();
  final _eventNameFocusNode = FocusNode();

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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
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
                    focusNode: _eventNameFocusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Event Name',
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
                const SizedBox(height: 16.0),
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
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Event Location',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the event location';
                      }
                      return null;
                    },
                    onSaved: (value) => eventLocation = value!,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
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
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050),
                              );
                              if (date != null) {
                                setState(() => _eventDate = date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Event Time',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              _eventTime == null
                                  ? 'Choose Time'
                                  : _eventTime.format(context),
                              style: TextStyle(
                                color: _eventTime == null ? null : Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (time != null) {
                                setState(() {
                                  _eventTime = time;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
