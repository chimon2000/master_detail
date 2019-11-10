import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:master_detail/core/model/item.dart';

class ItemListView extends StatelessWidget {
  final ValueChanged<Item> itemSelectedCallback;
  final Item selectedItem;

  const ItemListView({
    Key key,
    @required this.itemSelectedCallback,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items.map((item) {
        return ListTile(
          title: Text(item.title),
          onTap: () => itemSelectedCallback(item),
          selected: selectedItem == item,
        );
      }).toList(),
    );
  }
}
