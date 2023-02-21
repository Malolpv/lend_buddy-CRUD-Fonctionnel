import 'package:flutter/material.dart';
import 'package:lend_buddy/collections/Item.dart';

class LendedItemContainer extends StatelessWidget {
  final Item lendedItem;

  const LendedItemContainer({super.key, required this.lendedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(20),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
