import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  static String name = '/event_details_screen';
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  EventDetailPageState createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailsScreen>
    with TickerProviderStateMixin {
  String dropDownValue = "don't";
  String pageTitle = "Event Details";
  var items = [
    "don't",
    'on time',
    '5 min',
    '15 min',
    '30 min',
    '1 hour',
  ];
  late String selectedValue;
  bool isButtonDisabled = false;
  bool isExpanded = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildEventTitle(),
                      const SizedBox(height: 16),
                      buildEventDate(),
                      const SizedBox(height: 24),
                      buildAboutEvent(),
                      const SizedBox(height: 24),
                      buildOrganizeInfo(),
                      const SizedBox(height: 124),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildEnrollButton(),
          ),
        ],
      ),
    );
  }

  Widget buildEventTitle() {
    return Row(
      children: const <Widget>[
        Text(
          "The Super Event",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildEventDate() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(240, 234, 248, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Text('Mar',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 158, 107, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              Text('24',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Tuesday',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              "10:00 - 12:00 PM",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(
              height: 4,
            ),
            buildEventLocation(),
          ],
        ),
        const Spacer(),
        Container(child: isButtonDisabled ? buildReminder2() : const Text(''))
      ],
    );
  }

  Widget buildAboutEvent() {
    return Column(
      children: [
        SizeTransition(
          sizeFactor: animation,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              'Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
              maxLines: isExpanded ? null : 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        isExpanded
            ? TextButton.icon(
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Read less'),
                onPressed: () {
                  setState(() => isExpanded = false);
                  controller.reverse();
                })
            : TextButton.icon(
                icon: const Icon(Icons.arrow_downward),
                label: const Text('Read more'),
                onPressed: () {
                  setState(() => isExpanded = true);
                  controller.forward();
                })
      ],
    );
  }

  //   Widget buildAboutEvent() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: const <Widget>[
  //       Text("About",
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold)),
  //       SizedBox(),
  //       ReadMoreText(
  //        text:
  //             'Hello this is the description of this event that shows you what is the event is about Hello this is the description of this event that shows you what is the event is about',
  //             style: TextStyle(color: Colors.grey, fontSize: 14),
  //       ),
  //       SizedBox(
  //         height: 8,
  //       ),
  //       InkWell(
  //         child: Text(
  //           "Read more...",
  //           style: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //               decoration: TextDecoration.underline),
  //         ),
  //         onTap: () {},
  //       ),
  //     ],
  //   );
  // }


  Widget buildOrganizeInfo() {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          child: Text('H'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('High Academy',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromRGBO(240, 234, 248, 1),
          ),
          child: Text(
            "Details",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                background: Paint()
                  ..strokeWidth = 17.0
                  ..color = const Color.fromRGBO(240, 234, 248, 1)
                  ..style = PaintingStyle.stroke
                  ..strokeJoin = StrokeJoin.round),
          ),
        )
      ],
    );
  }

  Widget buildEventLocation() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: const [
          Icon(
            color: Colors.blue,
            Icons.location_on_outlined,
            size: 15,
          ),
          Text(
            "23 Rehab ST",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEnrollButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color.fromRGBO(255, 255, 255, 0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          foregroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: isButtonDisabled
            ? null
            : () {
                setState(() {
                  isButtonDisabled = true;
                });
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text("Set Reminder"),
                      content: buildReminder(),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              dropDownValue = selectedValue;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    );
                  }),
                );
              },
        child: Text(
          "Enroll",
          style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
              .copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildReminder() {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Color.fromRGBO(240, 234, 248, 1),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 37),
          const Text(
            "Add Reminder ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          SizedBox(
              width: 65,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return DropdownButton(
                    underline: const InputDecorator(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    value: dropDownValue,
                    alignment: const AlignmentDirectional(0.5, 1),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        alignment: Alignment.center,
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                  );
                },
              )),
        ],
      ),
    );
  }

  Widget buildReminder2() {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Color.fromRGBO(240, 234, 248, 1),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          const Text(
            "Add Reminder ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton(
                underline: const InputDecorator(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                borderRadius: BorderRadius.circular(12),
                value: dropDownValue,
                alignment: const AlignmentDirectional(0.5, 1),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    alignment: Alignment.center,
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                    selectedValue = newValue;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
