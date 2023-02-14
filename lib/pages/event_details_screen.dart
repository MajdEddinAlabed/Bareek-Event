import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class EventDetailsScreen extends StatefulWidget {
  static String name = '/event_details_screen';
  const EventDetailsScreen({Key? key}) : super(key: key);
  @override
  EventDetailPageState createState() => EventDetailPageState();
}

class EventDetailPageState extends State<EventDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController bodyScrollAnimationController;
  late ScrollController scrollController;
  late Animation<double> scale;
  late Animation<double> appBarSlide;
  double headerImageSize = 0;
  bool isFavorite = false;
  String dropDownValue = "don't";
  var items = [
    "don't",
    'on time',
    '5 min',
    '15 min',
    '30 min',
    '1 hour',
  ];

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    bodyScrollAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController.isCompleted) {
            bodyScrollAnimationController.forward();
          }
        } else {
          if (bodyScrollAnimationController.isCompleted) {
            bodyScrollAnimationController.reverse();
          }
        }
      });

    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController,
    ));

    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    bodyScrollAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    headerImageSize = MediaQuery.of(context).size.height / 2.5;
    return ScaleTransition(
      scale: scale,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeaderImage(),
                  Container(
                    // decoration: const BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [Color.fromARGB(20, 33, 149, 243), Color.fromARGB(20, 255, 255, 255)],
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //   ),
                    // ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        buildEventTitle(),
                        const SizedBox(height: 16),
                        buildEventDate(),
                        const SizedBox(height: 24),
                        buildAboutEvent(),
                        const SizedBox(height: 24),
                        buildOrganizeInfo(),
                        // const SizedBox(height: 24),
                        // buildEventLocation(),
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
      ),
    );
  }

  Widget buildHeaderImage() {
    double maxHeight = MediaQuery.of(context).size.height;
    double minimumScale = 0.8;
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        controller.value += detail.primaryDelta! / maxHeight * 2;
      },
      onVerticalDragEnd: (detail) {
        if (scale.value > minimumScale) {
          controller.reverse();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 0,
            child: Hero(
              tag: Image.asset(
                "assets/images/2.jpg",
                fit: BoxFit.cover,
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(32)),
                child: Image.asset(
                  "assets/images/2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
    //const Spacer(),
    // Column(
    //   children: const [
    //     Text(
    //       "Hight Academy",
    //       style: TextStyle(
    //         height: 2.399,
    //         color: Colors.grey,
    //         fontSize: 14,
    //       ),
    //     ),
    //   ],
    // ),
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
            Row(
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
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color.fromRGBO(240, 234, 248, 1),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8),
              const Text(
                "Add Reminder  ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              DropdownButton2(
                buttonWidth: 73,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                dropdownElevation: 3,
                value: dropDownValue,
                items: items.map(
                  (String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(
                    () {
                      dropDownValue = newValue!;
                    },
                  );
                },
              )
              // DropdownButton(
              //   borderRadius: BorderRadius.circular(12),
              //   value: dropDownValue,
              //   elevation: 3,
              //   alignment: const AlignmentDirectional(1, 5),
              // items: items.map((String items) {
              //   return DropdownMenuItem(
              //     value: items,
              //     child: Text(
              //       items,
              //       style: const TextStyle(
              //         color: Color.fromRGBO(255, 158, 107, 1),
              //         fontSize: 12,
              //       ),
              //     ),
              //   );
              // }).toList(),
              // onChanged: (String? newValue) {
              //   setState(() {
              //     dropDownValue = newValue!;
              //   });
              // },
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAboutEvent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("About",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        const SizedBox(),
        const Text(
            'Hello this is the description of this event that shows you what is the event is about',
            style: TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          child: Text(
            "Read more...",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline),
          ),
          onTap: () {},
        ),
      ],
    );
  }

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
            // Text(
            //   "Organizer: Majd Eddin",
            //   style: TextStyle(color: Colors.grey, fontSize: 14),
            // ),
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

  // Widget buildEventLocation() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       const Text(
  //         'Address',
  //         style: TextStyle(
  //           fontSize: 25,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 12,
  //       ),
  //       InkWell(
  //         child: Row(
  //           children: const [
  //             Icon(
  //               color: Colors.blue,
  //               Icons.location_on_outlined,
  //             ),
  //             Text(
  //               "23 Rehab ST",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Icon(
  //               Icons.double_arrow_rounded,
  //               size: 15,
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

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
        onPressed: () {},
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
}
