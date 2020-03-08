//
//  item_widget.dart
//
//  Created by Denis Bystruev on 03/03/2020.
//

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:look_creator/models/item.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemWidget extends StatelessWidget {
  final EdgeInsets insets;
  final Item item;

  ItemWidget(
    this.item, {
    this.insets = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl = item.pictures.first;
    assert(imageUrl != null);
    return GestureDetector(
      child: Padding(
        child: kIsWeb
            ? Image.network(imageUrl)
            : CachedNetworkImage(imageUrl: imageUrl),
        padding: insets,
      ),
      onTap: _launchURL,
    );
  }

  void _launchURL() async {
    final String url = item?.url;
    print('DEBUG in lib/widgets/item_widget.dart line 39: url = $url');
    final bool canLaunchUrl = await canLaunch(url);
    if (canLaunchUrl) await launch(url);
  }
}
