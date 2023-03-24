// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_app/utils/expandable_fab.dart';
import 'package:flutter/material.dart';
import '../utils/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String name = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _eventDate = DateTime.now();
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      drawer: DrawerClass(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: constraints.maxHeight - 40,
                      viewportFraction: 1,
                    ),
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/event_details_screen');
                        },
                        child: Card(
                          elevation: 10,
                          child: SingleChildScrollView(
                            child: Column(
                              children: imageSliders,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _isPressed = !_isPressed;
              });
            },
            backgroundColor: _isPressed ? Colors.blue : Colors.green,
            child: Icon(Icons.person),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: _selectDate,
            child: Icon(Icons.calendar_month),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.menu_rounded),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _eventDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() => _eventDate = date);
    }
  }
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        height: 220,
        width: double.infinity,
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                item,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: const [
                      Color.fromARGB(167, 3, 0, 10),
                      Color.fromARGB(104, 3, 0, 10),
                      Color.fromARGB(66, 3, 0, 10),
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                  )),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Organization ${imgList.indexOf(item) + 1} ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 87, 117, 218)),
                        ),
                        Text(
                          '24:00 - 24:00',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              color: Color.fromARGB(255, 250, 250, 250)),
                        ),
                      ],
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Event ${imgList.indexOf(item) + 1} ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 124, 224, 114)),
                        ),
                        Text(
                          'description talking here yes hello',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 15,
                              color: Color.fromARGB(255, 250, 250, 250)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    .toList();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  'https://media-cdn.tripadvisor.com/media/photo-s/03/9b/2f/5b/cairo.jpg',
  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
  'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
  'https://api.contentstack.io/v2/assets/575e4d1c0342dfd738264a1f/download?uid=bltada7771f270d08f6',
];
