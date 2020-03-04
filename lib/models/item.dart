//
//  item.dart
//
//  Created by Denis Bystruev on 03/03/2020.
//
//  Subset of https://github.com/dbystruev/Get-Outfit-Server/blob/master/Sources/Server/Models/YMLOffer.swift
//  Subset of https://yandex.ru/support/partnermarket/export/vendor-model.html

import 'package:decimal/decimal.dart';

class Item {
  final String id;
  final String name;
  final Decimal oldprice;
  final List<String> pictures;
  final Decimal price;
  final String url;

  Item(
      {this.id, this.name, this.oldprice, this.pictures, this.price, this.url});

  factory Item.fromJson(Map<String, dynamic> json) {
    if (json == null) throw FormatException('Null JSON provided to Item');
    final String oldprice = json['oldprice']?.toString();
    final String price = json['price']?.toString();
    return Item(
      id: json['id'],
      name: json['name'],
      oldprice: oldprice == null ? null : Decimal.parse(oldprice),
      pictures: json['pictures']?.cast<String>(),
      price: price == null ? null : Decimal.parse(price),
      url: json['url'],
    );
  }

  @override
  String toString() {
    return '''
      Item(
        id: $id,
        name: $name,
        oldprice: $oldprice,
        pictures: $pictures,
        price: $price,
        url: $url,
      )
    ''';
  }
}
