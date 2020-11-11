import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// Model
import 'package:coronavirus/src/models/countryData_model.dart';

class CustomProvider {
  String url = 'https://api.covid19api.com/summary';

  Future<List<CountryData>> getCountryDataList() async {
    var response = await http.get(this.url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      List<Object> rawCountries = jsonResponse['Countries'];
      List<CountryData> finalRespose = [];
      if (rawCountries != null) {
        rawCountries.forEach((element) {
          finalRespose.add(CountryData.fromMap(element));
        });
      }
      return finalRespose;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
