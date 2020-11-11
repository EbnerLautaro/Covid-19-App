import 'package:flutter/material.dart';
import 'package:coronavirus/src/pages/listView_page.dart';
import 'package:coronavirus/src/provider/countryData_provider.dart';

class LoadingPage extends StatelessWidget {
  final provider = CustomProvider();

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/img/banner-drawer.png'), context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(59, 66, 85, 1),
      body: Center(
        child: FutureBuilder(
          future: provider.getCountryDataList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListViewPage(
                countries: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return buildContainer(color: Colors.red, text: snapshot.error);
            } else {
              return buildContainer(color: Colors.white, text: 'Loading');
            }
          },
        ),
      ),
    );
  }

  Widget buildContainer({String text, Color color}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(color),
          ),
          SizedBox(height: 20),
          Text(
            '$text',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
