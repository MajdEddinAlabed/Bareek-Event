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
  List<bool> isSelected = [];
  int? editingCardIndex = -1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          if (showCheckboxes || editingCardIndex != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  showCheckboxes = false;
                  editingCardIndex = null;
                  isSelected = List<bool>.generate(count, (int index) => false);
                });
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                showCheckboxes = !showCheckboxes;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          addressesCard(),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              height: 56,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: isSelected.contains(true)
                        ? () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                      const Text('Delete selected addresses?'),
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
                                          isSelected = List<bool>.generate(
                                              count, (int index) => false);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Popup Title'),
                            content: const Text('This is my popup.'),
                            actions: [
                              TextButton(
                                child: const Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressesCard() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          shadowColor: Colors.grey.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: ListTile(
            leading: showCheckboxes
                ? Checkbox(
                    value: isSelected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                  )
                : null,
            title: const Text('Address Name'),
            subtitle: const Text('1234 Address St.'),
            trailing: showCheckboxes
                ? IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        editingCardIndex =
                            index; // set editingCardIndex to the index of the card being edited
                      });
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
