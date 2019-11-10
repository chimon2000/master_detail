import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:master_detail/core/model/item.dart';
import 'package:master_detail/ui/widgets/adaptive_item_details.dart';
import 'package:master_detail/ui/widgets/item_list_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdaptiveMasterDetail extends StatefulWidget {
  const AdaptiveMasterDetail({Key key}) : super(key: key);

  @override
  _AdaptiveMasterDetailState createState() => _AdaptiveMasterDetailState();
}

class _AdaptiveMasterDetailState extends State<AdaptiveMasterDetail> {
  Item _selectedItem;

  _buildMobileLayout() {
    return ItemListView(
      itemSelectedCallback: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AdaptiveItemDetails(item: item),
          ),
        );
      },
    );
  }

  _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: ItemListView(
              itemSelectedCallback: (item) {
                setState(() {
                  print(_selectedItem.title);
                  _selectedItem = item;
                });
              },
              selectedItem: _selectedItem,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: AdaptiveItemDetails(
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var content =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? _buildMobileLayout()
                : _buildTabletLayout();

        return Scaffold(
          appBar: AppBar(
            title: Text('Master-detail flow sample'),
          ),
          body: content,
        );
      },
    );
  }
}
