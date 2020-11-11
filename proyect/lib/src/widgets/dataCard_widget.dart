import 'package:flutter/material.dart';
import 'package:humanize/humanize.dart' as humanize;

class DataCard extends StatelessWidget {
  const DataCard({
    Key key,
    @required this.title,
    @required this.totalData,
    @required this.newData,
  }) : super(key: key);

  final String title;
  final int totalData;
  final int newData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Card(
          margin: EdgeInsets.all(4),
          color: Color.fromRGBO(81, 89, 108, 1),
          elevation: 5,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        totalData == null
                            ? 'Total: -'
                            : 'Total: ${humanize.intComma(totalData)}',
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                      Text(
                        newData == null
                            ? 'New: -'
                            : 'New: ${humanize.intComma(newData)}',
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
