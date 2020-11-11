import 'package:flutter/material.dart';
import 'package:coronavirus/src/models/countryData_model.dart';
import 'package:coronavirus/src/widgets/countryCard_widget.dart';

class ListViewPage extends StatefulWidget {
  final List<CountryData> countries;
  const ListViewPage({Key key, @required this.countries}) : super(key: key);

  @override
  _ListViewPageState createState() {
    return _ListViewPageState(
      countryList: countries,
    );
  }
}

class _ListViewPageState extends State<ListViewPage> {
  List<CountryData> countryList;
  List<CountryData> countryListDisplay;
  _ListViewPageState({@required this.countryList});
  int sortedValue;

  @override
  void initState() {
    sortedValue = 0;
    countryList.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
    countryList = countryList.reversed.toList();
    countryListDisplay = countryList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covid-19 Stats'),
        backgroundColor: Color.fromRGBO(59, 66, 85, 1),
        elevation: 10,
      ),
      backgroundColor: Color.fromRGBO(59, 66, 85, 1),
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.white30,
                child: ListView.builder(
                  itemCount: countryListDisplay.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? Column(
                            children: [
                              Image.asset('assets/img/banner-drawer.png'),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: searchBar(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: sortButton(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.fromLTRB(4, 8, 4, 4),
                            child: CountryCard(
                              title: countryListDisplay[index - 1].name,
                              confirmed:
                                  countryListDisplay[index - 1].totalConfirmed,
                              deaths: countryListDisplay[index - 1].totalDeaths,
                              code: countryListDisplay[index - 1].code,
                              function: () => Navigator.pushNamed(
                                context,
                                'detail-view',
                                arguments: countryListDisplay[index - 1],
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sort(value) {
    switch (value) {
      case 0:
        setState(() {
          this.sortedValue = value;
          countryList
              .sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
          countryList = countryList.reversed.toList();
          countryListDisplay = countryList;
        });
        break;
      case 1:
        setState(() {
          this.sortedValue = value;
          countryList
              .sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
          countryListDisplay = countryList;
        });
        break;
      case 2:
        setState(() {
          this.sortedValue = value;
          countryList.sort((a, b) => a.totalDeaths.compareTo(b.totalDeaths));
          countryList = countryList.reversed.toList();
          countryListDisplay = countryList;
        });
        break;
      case 3:
        setState(() {
          this.sortedValue = value;
          countryList.sort((a, b) => a.totalDeaths.compareTo(b.totalDeaths));
          countryListDisplay = countryList;
        });
        break;
      case 4:
        setState(() {
          this.sortedValue = value;
          countryList.sort((a, b) => a.name.compareTo(b.name));
          countryListDisplay = countryList;
        });
        break;
    }
  }

  Widget searchBar() {
    return Card(
      color: Color.fromRGBO(81, 89, 108, 1),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        child: TextField(
          autofocus: false,
          cursorColor: Colors.white,
          onSubmitted: (value) => print('ready: $value'),
          textCapitalization: TextCapitalization.sentences,
          autocorrect: true,
          style: TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.white70,
            ),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
          onChanged: (text) {
            text = text.toLowerCase().trim();
            setState(() {
              countryListDisplay = countryList.where((element) {
                var title = element.name.toLowerCase();
                return title.contains(text);
              }).toList();
            });
          },
        ),
      ),
    );
  }

  Widget sortButton() {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      color: Color.fromRGBO(81, 89, 108, 1),
      child: PopupMenuButton(
        padding: EdgeInsets.zero,
        initialValue: sortedValue,
        tooltip: 'Sort by',
        onSelected: sort,
        color: Color.fromRGBO(86, 94, 113, 1),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(81, 89, 108, 1),
          ),
          padding: EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sort by',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.white),
              child: Text('More cases'),
              value: 0,
            ),
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.white),
              child: Text('Least cases'),
              value: 1,
            ),
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.white),
              child: Text('More deaths'),
              value: 2,
            ),
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.white),
              child: Text('Least deaths'),
              value: 3,
            ),
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.white),
              child: Text('Country name'),
              value: 4,
            ),
          ];
        },
      ),
    );
  }
}
