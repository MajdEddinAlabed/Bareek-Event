import 'package:event_app/drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventList extends StatefulWidget {
  const EventList({super.key, required this.title});
  final String title;

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const DrawerClass(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SfCalendar(
        view: CalendarView.day,
        showCurrentTimeIndicator: true,
        showDatePickerButton: true,
        allowViewNavigation: true,
        // ignore: prefer_const_literals_to_create_immutables
        allowedViews: [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
          CalendarView.schedule,
        ],
        firstDayOfWeek: 6,
        dataSource: MeetingDataSource(getAppointment()),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String name;
  final Widget icon;

  const DrawerItems(this.name, {super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      minLeadingWidth: 10,
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

List<Appointment> getAppointment() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(
    const Duration(hours: 2),
  );

  meetings.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Event',
      color: Colors.purple,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
    ),
  );
  meetings.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Event 2',
      color: Color.fromARGB(255, 201, 8, 98),
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
    ),
  );
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
