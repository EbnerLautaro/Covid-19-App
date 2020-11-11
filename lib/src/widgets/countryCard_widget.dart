import 'package:flutter/material.dart';
import 'package:humanize/humanize.dart' as humanize;

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key,
    @required this.title,
    @required this.confirmed,
    @required this.deaths,
    @required this.code,
    @required this.function,
  }) : super(key: key);

  final String title;

  final int confirmed;
  final int deaths;
  final String code;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 4,
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        borderRadius: BorderRadius.circular(5),
        splashColor: Color.fromRGBO(149, 198, 212, 1),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            color: Color.fromRGBO(81, 89, 108, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          width: double.infinity,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            leading: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Hero(
                  
                  tag: title,
                  child: Image.asset(
                    'icons/flags/png/2.5x/${code.toLowerCase()}.png',
                    fit: BoxFit.cover,
                    package: 'country_icons',
                    height: 40,
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Confirmed: ${humanize.intComma(confirmed)}',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Deaths: ${humanize.intComma(deaths)}',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            dense: true,
          ),
        ),
      ),
    );
  }
}
