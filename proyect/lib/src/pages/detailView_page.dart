import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:coronavirus/src/models/countryData_model.dart';
import 'package:coronavirus/src/widgets/dataCard_widget.dart';
import 'package:coronavirus/src/widgets/headerCard_widget.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  bool fav;

  @override
  void initState() {
    super.initState();
    fav = false;
  }

  @override
  Widget build(BuildContext context) {
    CountryData country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color.fromRGBO(59, 66, 85, 1),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => share(context, country),
            child: Icon(Icons.share),
            backgroundColor: Color.fromRGBO(81, 89, 108, 1),
            elevation: 5,
            tooltip: 'Share',
            heroTag: '1',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_rounded),
            backgroundColor: Color.fromRGBO(81, 89, 108, 1),
            elevation: 5,
            tooltip: 'Back',
            heroTag: '2',
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 100),
        children: [
          HeaderCard(
            name: country.name,
            code: country.code,
            mortality: country.getMortality(4),
          ),
          DataCard(
            title: 'Confirmed',
            totalData: country.totalConfirmed,
            newData: country.newConfirmed,
          ),
          DataCard(
            title: 'Deaths',
            totalData: country.totalDeaths,
            newData: country.newDeaths,
          ),
          DataCard(
            title: 'Recovered',
            totalData: country.totalRecovered,
            newData: country.newRecovered,
          ),
        ],
      ),
    );
  }

  void share(BuildContext context, CountryData country) {
    final RenderBox box = context.findRenderObject();
    final String subject = 'Covid-19 data for: ${country.name}';
    final String message = 'Covid-19 data for: *${country.name}*'
        '\n\t_Total cases:_ ${country.totalConfirmed}'
        '\n\t_Total deaths:_ ${country.totalDeaths}'
        '\n\t_Total recoveries:_ ${country.totalRecovered}'
        '\n\t_New cases:_ ${country.totalConfirmed} '
        '\n\t_New deaths:_ ${country.newDeaths}'
        '\n\t_New recoveries:_ ${country.newRecovered}';

    Share.share(
      message,
      subject: subject,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}
