import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bareek Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Majd Eddin"),
              accountEmail: const Text("majdeddin6@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset(
                  "assets/images/2.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const DrawerItems('Home', icon: Icon(Icons.home),),
            const DrawerItems('Organizations', icon: Icon(Icons.groups_outlined),),
            const DrawerItems('My organizations', icon: Icon(Icons.group_work_outlined),),
            const DrawerItems('Settings', icon: Icon(Icons.settings),),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SfCalendar(
          view: CalendarView.day,
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
      subject: 'Meeting',
      color: Colors.purple,
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
