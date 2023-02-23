import 'package:flutter/material.dart';

class AddressesListScreen extends StatefulWidget {
  static String name = '/addresses_list_screen';
  const AddressesListScreen({super.key});

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

class _AddressesListScreenState extends State<AddressesListScreen> {
  String pageTitle = 'My Addresses';
  int count = 3;
  bool showCheckboxes = false;
  List<bool> checked = List.filled(3, false);

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
                setState(() {
                  showCheckboxes = true;
                });
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
      floatingActionButton: showCheckboxes
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  for (int i = checked.length - 1; i >= 0; i--) {
                    if (checked[i]) {
                      count--;
                      checked.removeAt(i);
                    }
                  }
                  showCheckboxes = false;
                });
              },
              child: const Icon(Icons.delete),
            )
          : null,
      body: Stack(
        children: [
          addressesCard(),
        ],
      ),
    );
  }

  Widget addressesCard() {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Card $index',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (showCheckboxes)
                            Checkbox(
                              value: checked[index],
                              onChanged: (value) {
                                setState(() {
                                  checked[index] = value!;
                                });
                              },
                            ),
                        ],
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
      count++;
      checked.add(false);
    });
  }
}