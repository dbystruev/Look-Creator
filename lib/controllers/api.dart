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

  String get fragment => _baseUri.fragment;

  String get host => _baseUri.host;

  int get port => _baseUri.port;

  String get scheme => _baseUri.scheme;

  String get unencodedPath => _baseUri.pathSegments.join('/');

  String get userInfo => _baseUri.userInfo;

  Api({Uri uri}) {
    this._baseUri = uri ?? Uri.http('server.getoutfit.ru', 'offers');
  }

  Future<Item> getItem(String id) async => (await getItems([id]))?.first;

  Future<List<Item>> getItems(List<String> ids) async {
    final Map<String, List<String>> queryParameters = {'id': ids};
    final Uri queryUri = Uri(
      scheme: scheme,
      userInfo: userInfo,
      host: host,
      port: port,
      path: unencodedPath,
      queryParameters: queryParameters,
      fragment: fragment,
    );
    final http.Response response = await http.get(queryUri);
    if (response.statusCode == 200) {
      final Iterable<Item> unsortedItems = convert
          .jsonDecode(response.body)
          .map(
            (itemJson) => Item.fromJson(itemJson),
          )
          .cast<Item>();
      final Map<String, Item> mappedItems =
          Map<String, Item>.fromIterable(unsortedItems, key: (item) => item.id);
      return ids.map((id) => mappedItems[id]).toList();
    } else
      return null;
  }
}
