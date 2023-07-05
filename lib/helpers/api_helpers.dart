import 'dart:convert';
import 'package:country_detail_app/globals/globals.dart';
import 'package:country_detail_app/models/api_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future getData() async {
    String words = Global.search;
      // String api = "https://restcountries.com/v3.1/all";
       String api = "https://restcountries.com/v3.1/all/$words?fullText=false";
    http.Response data = await http.get(Uri.parse(api));

    if (data.statusCode == 200) {
      List decodedData = jsonDecode(data.body);

      List<Info> info = (decodedData
          .map((e) => Info.formMap(
                common: e['name']['common'],
                population: e['population'],
                capital: e['capital'] ?? [],
                time: e['timezones'] ?? [],
                area: e['area'],
                continents: e['continents'],
                subregion: e['subregion'],
                region: e['region'],
                flags: e['flags']['png'],
                languages: e['languages'] ?? {},
              ))
          .toList());
      return info;
    }
    return null;
  }
}
