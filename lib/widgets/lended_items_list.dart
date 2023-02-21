import 'package:flutter/material.dart';
import 'package:lend_buddy/collections/lend.dart';
import 'package:lend_buddy/services/isar_helper.dart';

class LendedItemsList extends StatefulWidget {
  final IsarHelper dataSource;
  final int userId;
  const LendedItemsList(
      {super.key, required this.dataSource, required this.userId});
  @override
  State<LendedItemsList> createState() => _LendedItemsList();
}

class _LendedItemsList extends State<LendedItemsList> {
  List<Lend> _lendItems = [];
  _fetchListItems() async {
    List<Lend> tmpLendList =
        await widget.dataSource.getAllActiveLend(widget.userId);
    setState(() {
      _lendItems = tmpLendList;
    });
    return _lendItems;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchListItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _lendItems.length,
              itemBuilder: (context, index) {
                final item = _lendItems[index];
                return Dismissible(
                    // Each Dismissible must contain a Key. Keys allow Flutter to
                    // uniquely identify widgets.
                    key: Key(item.id.toString()),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      // Then show a snackbar.
                      if (DismissDirection.startToEnd == direction) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('${item.item.value?.libelle} returned')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('${item.item.value?.libelle} deleted')));
                      }
                      setState(() => _lendItems.removeAt(index));
                    },
                    // Show a red background as the item is swiped away to the rigth.
                    background: slideRightBackground(),
                    // Show a red background as the item is swiped away to the left.
                    secondaryBackground: slideLeftBackground(),
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      padding: const EdgeInsets.all(20),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(item.item.value?.libelle.toUpperCase() ?? "",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text("Lended to : ${item.contact}",
                              style: const TextStyle(fontSize: 20)),
                          Text(
                            "Return date : ${item.endDate.toString().split(" ").first}",
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    confirmDismiss: (DismissDirection direction) async {
                      return await showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            if (direction == DismissDirection.startToEnd) {
                              return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text("Item returned ?"),
                                  actions: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                        _lendItems[index].returned();

                                        widget.dataSource
                                            .saveLend(_lendItems[index]);
                                        // setState(() {
                                        //   _lendItems.removeAt(index);
                                        // });
                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('CANCEL'),
                                    )
                                  ]);
                            } else {
                              return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                      "Are you sure you wish to delete this item?"),
                                  actions: <Widget>[
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('CANCEL'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                        widget.dataSource.deleteLend(item.id);
                                        _lendItems.removeAt(index);
                                      },
                                      child: const Text('OK'),
                                    )
                                  ]);
                            }
                          }));
                    });
              },
            );
          }
        });
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.check,
            color: Colors.white,
            size: 40,
          ),
          Text(
            "Returned",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
