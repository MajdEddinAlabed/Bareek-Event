import 'package:flutter/material.dart';

class AddressesListScreen extends StatefulWidget {
  static String name = '/addresses_list_screen';
  const AddressesListScreen({Key? key}) : super(key: key);

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

class _AddressesListScreenState extends State<AddressesListScreen> {
  String pageTitle = 'My Addresses';
  int count = 3;
  bool showCheckboxes = false;
  List<bool> checked = List.filled(3, false);
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.generate(count, (int index) => false);
  }

  void addAddress() {
    setState(() {
      count++;
      isSelected.add(false);
    });
  }

  void deleteSelected() {
    setState(() {
      for (int i = isSelected.length - 1; i >= 0; i--) {
        if (isSelected[i]) {
          count--;
          isSelected.removeAt(i);
        }
      }
      showCheckboxes = false;
    });
  }

  Widget _buildDeleteButton() {
    if (isSelected.contains(true)) {
      return IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Delete selected addresses?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        deleteSelected();
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isSelected = List<bool>.generate(count, (int index) => false);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      return const IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: null,
      );
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          _buildDeleteButton(),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addAddress,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(color: Colors.white),
                          child: Text(
                            'Address ${index + 1}',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const DefaultTextStyle(
                          style: TextStyle(color: Colors.white),
                          child: Text(
                            '123 Main St\nAnytown, USA 12345',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    value: isSelected[index],
                    onChanged: (value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addressesCard() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(color: Colors.white),
                        child: Text(
                          'Address ${index + 1}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const DefaultTextStyle(
                        style: TextStyle(color: Colors.white),
                        child: Text(
                          '123 Main St\nAnytown, USA 12345',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showCheckboxes)
                  Checkbox(
                    value: isSelected[index],
                    onChanged: (value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}