import 'package:flutter/material.dart';

// Pages
import 'package:coronavirus/src/pages/loading_page.dart';
import 'package:coronavirus/src/pages/detailView_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App',
      home: LoadingPage(),
      routes: <String, WidgetBuilder>{
        'detail-view': (BuildContext context) => DetailView(),
      },
    );
  }
}
