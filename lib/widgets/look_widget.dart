//
//  look_widget.dart
//
//  Created by Denis Bystruev on 03/03/2020.
//

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:look_creator/models/layout.dart';
import 'package:look_creator/widgets/item_widget.dart';

class LookWidget extends StatefulWidget {
  final List<ItemWidget> itemWidgets;
  final Layout layout;

  LookWidget(this.itemWidgets, {this.layout = Layout.bottom_right});

  @override
  _LookWidgetState createState() => _LookWidgetState(itemWidgets);
}

class _LookWidgetState extends State<LookWidget> {
  int counter = 0;
  List<ItemWidget> itemWidgets;
  final Layout layout;
  Timer timer;

  _LookWidgetState(this.itemWidgets, {this.layout = Layout.bottom_right});

  @override
  Widget build(BuildContext context) {
    final List<Expanded> looks = itemWidgets
        .map(
          (item) => Expanded(
            child: item,
          ),
        )
        .toList();
    switch (looks.length) {
      case 1:
        return looks.first.child;
      case 2:
        return Row(
          children: <Widget>[
            looks.first,
            looks.last,
          ],
        );
      case 3:
        switch (layout) {
          case Layout.bottom_left:
            return Row(
              children: <Widget>[
                expandedColumn(looks.first, looks[1]),
                looks.last,
              ],
            );
          case Layout.bottom_right:
            return Row(
              children: <Widget>[
                looks.first,
                expandedColumn(looks[1], looks.last),
              ],
            );
        }
        throw ('Unknown layout in case 3');
      case 4:
        return Row(
          children: <Widget>[
            expandedColumn(looks.first, looks[1]),
            expandedColumn(looks[2], looks.last),
          ],
        );
      case 5:
        switch (layout) {
          case Layout.bottom_left:
            return Row(
              children: <Widget>[
                expandedColumn(
                  looks.first,
                  expandedColumn(looks[2], looks[3]),
                ),
                expandedColumn(looks[1], looks.last),
              ],
            );
          case Layout.bottom_right:
            return Row(
              children: <Widget>[
                expandedColumn(looks.first, looks[2]),
                expandedColumn(
                  looks[1],
                  expandedColumn(looks[3], looks.last),
                ),
              ],
            );
        }
        throw ('Unknown layout in case 5');
      case 6:
        return Row(
          children: <Widget>[
            expandedColumn(
              looks.first,
              expandedColumn(looks[2], looks[4]),
            ),
            expandedColumn(
              looks[1],
              expandedColumn(looks[3], looks.last),
            ),
          ],
        );
      default:
        return Text(
          counter < 2 ? 'Loading items...' : 'Loading for $counter seconds...',
        );
    }
  }

  @override
  void didUpdateWidget(LookWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    itemWidgets = widget.itemWidgets;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Expanded expandedColumn(Expanded first, Expanded last) => Expanded(
        child: Column(
          children: <Widget>[first, last],
        ),
      );

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(() => ++counter);
        if (0 < itemWidgets.length) timer.cancel();
      },
    );
  }
}
