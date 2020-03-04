//
//  api.dart
//
//  Created by Denis Bystruev on 04/03/2020.
//
//  Class for working with Get Outfit API https://github.com/dbystruev/Get-Outfit-Server

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:look_creator/models/item.dart';

class Api {
  Uri _baseUri;

  String get authority => _baseUri.authority;

  Uri get baseUri => _baseUri;

  String get scheme => _baseUri.scheme;

  String get unencodedPath => _baseUri.pathSegments.join('/');

  Api({Uri uri}) {
    this._baseUri = uri ?? Uri.http('server.getoutfit.ru', 'offers');
  }

  Future<Item> getItem(String id) async {
    final Map<String, String> query = {'id': id};
    final Uri queryUri = scheme == 'http'
        ? Uri.http(authority, unencodedPath, query)
        : scheme == 'https' ? Uri.https(authority, unencodedPath, query) : null;
    if (queryUri == null) throw ('Unknown scheme $scheme');
    final http.Response response = await http.get(queryUri);
    if (response.statusCode == 200) {
      print(
          'DEBUG lib/controllers/api.dart line 40: response.body = ${response.body}');
      return convert
          .jsonDecode(response.body)
          .map(
            (itemJson) => Item.fromJson(itemJson),
          )
          .toList()
          .first;
    } else
      return null;
  }
}
