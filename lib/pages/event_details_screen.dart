import 'package:flutter/material.dart';
import 'dart:ui';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, required String title});
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailsScreen>
    with TickerProviderStateMixin {
  late Animation<double> scale;
  late ScrollController scrollController;
  late AnimationController controller;
  late Animation<double> appBarSlide;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
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
                          //...List.generate(10, (index) => ListTile(title: Text("Dummy content"))).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: buildPriceInfo(),
              ),
            ],
          ),
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
    return const Text("The Super Event",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget buildEventDate() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 234, 248, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
          children: const <Widget>[
            Text('Tuesday',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("10:00 - 12:00 PM",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(), color: Color.fromRGBO(240, 234, 248, 1)),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8),
              const Text("Add To Calendar",
                  style: TextStyle(
                      color: Color.fromRGBO(240, 234, 248, 1), fontSize: 14)),
              FloatingActionButton(
                mini: true,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
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
          child: Text('M'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Majd Eddin',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("Organizer",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            foregroundColor: const Color.fromRGBO(240, 234, 248, 1),
          ),
          child: Text("Follow",
              style: TextStyle(color: Theme.of(context).primaryColor)),
        )
      ],
    );
  }

  Widget buildPriceInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Price",
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "30",
                        style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)
                            .copyWith(color: Theme.of(context).primaryColor)),
                    const TextSpan(
                        text: "/per person",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              foregroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
            child: Text(
              "Get a Ticket",
              style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
