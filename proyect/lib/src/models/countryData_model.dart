class CountryData {
  String name;
  String code;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String lastUpdate;
  double mortality;

  CountryData(
    this.name,
    this.code,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.lastUpdate,
    this.mortality,
  );

  CountryData.fromMap(Map<String, dynamic> map) {
    name = map['Country'];
    code = map['CountryCode'];
    slug = map['Slug'];
    newConfirmed = map['NewConfirmed'];
    totalConfirmed = map['TotalConfirmed'];
    newDeaths = map['NewDeaths'];
    totalDeaths = map['TotalDeaths'];
    newRecovered = map['NewRecovered'];
    totalRecovered = map['TotalRecovered'];
    lastUpdate = map['Date'];
    mortality = map['TotalDeaths'] / map['TotalConfirmed'];

    if (mortality.isNaN) {
      mortality = 0.000000;
    } else {}
  }

  String getMortality(int limiter) {
    String a = mortality.toString();
    int cont = 0;
    String resp = '';
    for (String i in a.split('')) {
      if (cont <= limiter) {
        resp += i;
      }
      cont++;
    }
    return resp;
  }
}
