//
//  item.dart
//
//  Created by Denis Bystruev on 03/03/2020.
//
//  Subset of https://github.com/dbystruev/Get-Outfit-Server/blob/master/Sources/Server/Models/YMLOffer.swift
//  Subset of https://yandex.ru/support/partnermarket/export/vendor-model.html

import 'package:decimal/decimal.dart';

class Item {
  final String name;
  final Decimal oldprice;
  final List<String> pictures;
  final Decimal price;
  final String url;

  Item({this.name, this.oldprice, this.pictures, this.price, this.url});
}
