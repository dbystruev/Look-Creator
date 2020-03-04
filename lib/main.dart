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
  final List<ItemWidget> items = [
    ItemWidget(
      Item(pictures: [
        'https://a.lmcdn.ru/pi/img600x866/A/M/AM029EBGAMM6_9091095_1_v1.jpg',
      ]),
    ),
    ItemWidget(
      Item(pictures: [
        'https://a.lmcdn.ru/pi/img600x866/A/N/AN225EGGURF0_9495585_1_v1.jpg',
      ]),
    ),
    ItemWidget(
      Item(pictures: [
        'https://a.lmcdn.ru/pi/img600x866/A/T/AT006EBCSCT1_7233399_1_v1.jpg',
      ]),
    ),
    ItemWidget(
      Item(pictures: [
        'https://a.lmcdn.ru/pi/img600x866/A/D/AD002BUEEDG3_7997272_1_v1.jpg'
      ]),
    ),
    ItemWidget(
      Item(pictures: [
        'https://a.lmcdn.ru/pi/img600x866/A/D/AD002ABFKOD0_8782617_1_v1.jpg'
      ]),
      insets: EdgeInsets.only(bottom: 25),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    offersApi
        .getItem('AR037EWFXUV5')
        .then(
          (Item item) => print('DEBUG lib/main.dart line 72: $item'),
        )
        .catchError(
          (error) => print('ERROR lib/main.dart line 75: $error'),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Center(
        child: LookWidget(items, layout: Layout.bottom_right),
      ),
    );
  }
}
