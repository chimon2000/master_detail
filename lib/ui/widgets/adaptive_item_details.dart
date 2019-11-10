import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:master_detail/core/model/item.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdaptiveItemDetails extends StatelessWidget {
  final Item item;

  AdaptiveItemDetails({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final Widget content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(item.title),
          ],
        );

        return sizingInformation.deviceScreenType == DeviceScreenType.Tablet
            ? Center(child: content)
            : Scaffold(
                appBar: AppBar(
                  title: Text(item.title),
                ),
                body: Center(child: content),
              );
      },
    );
  }
}
