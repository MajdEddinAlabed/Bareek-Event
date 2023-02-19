import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddressesListScreen extends StatefulWidget {
  static String name = '/addresses_list_screen';
  const AddressesListScreen({super.key});

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

class _AddressesListScreenState extends State<AddressesListScreen> {
  String pageTitle = 'Your Addresses';
  late int count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.edit_outlined),
            onSelected: (value) {
              if (value == 'addAddress') {
                addAddress();
              } else if (value == 'removeAddress') {
                // Do something when removeAddress is selected.
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'addAddress',
                child: Text('Add new address'),
              ),
              const PopupMenuItem(
                value: 'removeAddress',
                child: Text('Remove address'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          addressesCard(),
        ],
      ),
      // ListView(
      //   children: <Widget>[
      //     ListTile(
      //       title: const Text('Address 1'),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: const <Widget>[
      //           Text('Country:'),
      //           Text('City:'),
      //           Text('Address:'),
      //           Text('Location:'),
      //           Text('Additional Info:'),
      //         ],
      //       ),
      //     ),
      //     ListTile(
      //       title: const Text('Address 2'),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: const <Widget>[
      //           Text('Country:'),
      //           Text('City:'),
      //           Text('Address:'),
      //           Text('Location:'),
      //           Text('Additional Info:'),
      //         ],
      //       ),
      //     ),
      //     ListTile(
      //       title: const Text('Address 3'),
      //       subtitle: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: const <Widget>[
      //           Text('Country:'),
      //           Text('City:'),
      //           Text('Address:'),
      //           Text('Location:'),
      //           Text('Additional Info:'),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       height: 220,
      //       child: const Card(
      //         color: Colors.black,
      //         child: Padding(
      //           padding: EdgeInsets.all(16.0),
      //           child: Text(
      //             'Text inside the card',
      //             style: TextStyle(fontSize: 24.0, color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget addressesCard() {
    count = 3;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                  style: const TextStyle(color: Colors.white),
                  child: Column(
                    children: [
                      Text(
                        'Card $index',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Text 1',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Text 2',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addAddress() {
    setState(() {
      count + 1;
    });
  }
}
