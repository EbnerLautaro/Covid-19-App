import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key key,
    @required this.name,
    @required this.code,
    @required this.mortality,
  }) : super(key: key);

  final String name;
  final String code;
  final String mortality;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 40),
                child: Card(
                  color: Color.fromRGBO(81, 89, 108, 1),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.only(top: 55, bottom: 8),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            '${name.toUpperCase()}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTextStyle(
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Mortality: $mortality'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 160,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Hero(
                      tag: name,
                      child: Image.asset(
                        'icons/flags/png/${code.toLowerCase()}.png',
                        fit: BoxFit.cover,
                        package: 'country_icons',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
