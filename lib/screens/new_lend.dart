import 'package:flutter/material.dart';
import 'package:lend_buddy/collections/item.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/collections/user.dart';
import 'package:lend_buddy/services/isar_helper.dart';

//CODED BY MALO

class NewLend extends StatefulWidget {
  @override
  State<NewLend> createState() => _NewLendState();

  final int userId;
  final IsarHelper datasource;

  NewLend({super.key, required this.userId, required this.datasource});
  List<Item> items = [];
  Lend newLend = Lend();
}

class _NewLendState extends State<NewLend> {
  final dialogController = TextEditingController();
  final dateController = TextEditingController();
  final contactController = TextEditingController();

  List<Item> _listItems = [];
  DateTime selectedDate = DateTime.now();
  Future<List<Item>> _fetchListItems() async {
    List<Item> rawItemList = await widget.datasource.getAllItems(widget.userId);
    setState(() {
      _listItems = rawItemList;
    });
    return _listItems;
  }

  @override
  void initState() {
    super.initState();
    _fetchListItems();

    dateController.text = selectedDate.toString().split(" ").first;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dialogController.dispose();
    dateController.dispose();
    contactController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toString().split(" ").first;
      });
    }
  }

  Future openDialog(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("New Item"),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: "Item name"),
              controller: dialogController,
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    if (dialogController.text != "") {
                      Navigator.of(context).pop();
                      User? tmpUser =
                          await widget.datasource.getUserById(widget.userId);
                      Item newItem = Item()
                        ..libelle = dialogController.text
                        ..user.value = tmpUser;
                      widget.datasource.saveItem(newItem);
                      _fetchListItems();
                    }
                  },
                  child: const Text("Submit"))
            ],
          ));

  Item? getFirstDropDownValue() {
    if (_listItems.isNotEmpty) {
      return _listItems[0];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: const Text('New Lend'),
      ),
      body: Column(children: [
        Container(
          child: Column(
            children: [
              const Text(
                "Select an item to lend \n or create a new one",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      style: const TextStyle(fontSize: 15),
                      value: getFirstDropDownValue(),
                      hint: const Text("Choose an item"),
                      items: _listItems.map((item) {
                        return DropdownMenuItem(
                            value: item,
                            key: Key(item.id.toString()),
                            child: Text(
                              item.libelle,
                              style: TextStyle(color: Colors.black),
                            ));
                      }).toList(),
                      onChanged: (Item? item) {
                        setState(() {
                          widget.newLend.item.value = item;
                        });
                      }),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade800),
                      onPressed: () {
                        openDialog(context);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 30,
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "Contact",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      controller: contactController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 30,
                    child: TextField(
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: "Ending date",
                      ),
                      controller: dateController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_today),
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade800),
                  )
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade800),
          onPressed: () async {
            if (dateController.text != "" &&
                contactController.text != "" &&
                widget.newLend.item.value != null) {
              Navigator.pop(context);
              User? tmpUser =
                  await widget.datasource.getUserById(widget.userId);
              widget.newLend
                ..startDate = DateTime.now()
                ..endDate = DateTime.parse(dateController.text)
                ..contact = contactController.text
                ..user.value = tmpUser;
              widget.datasource.saveLend(widget.newLend);
            }
          },
          child: const Text(
            "Save",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
