import 'package:flutter/material.dart';
import 'package:look_creator/controllers/api.dart';
import 'package:look_creator/models/item.dart';
import 'package:look_creator/models/layout.dart';
import 'package:look_creator/widgets/item_widget.dart';
import 'package:look_creator/widgets/look_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MyHomePage(title: 'Look Creator'),
      ),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      title: 'Look Creator',
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Api offersApi = Api();
  final List<String> itemIds = [
    'AM029EBGAMM6',
    'AN225EGGURF0',
    'AT006EBCSCT1',
    'AD002BUEEDG3',
    'AD002ABFKOD0'
  ];
  List<Item> items = [];
  List<ItemWidget> itemWidgets = [];

  @override
  void initState() {
    super.initState();
    offersApi
        .getItems(itemIds)
        .then(
          (items) => setState(() {
            itemWidgets = items
                .map(
                  (item) => ItemWidget(item),
                )
                .toList();
          }),
        )
        .catchError(
          (error) => print('ERROR loading items: $error'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Center(
        child: LookWidget(itemWidgets, layout: Layout.bottom_right),
      ),
    );
  }
}
