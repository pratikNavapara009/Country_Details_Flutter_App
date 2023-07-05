import 'dart:typed_data';

class Info {
  String countries;
  int population;
  List capital;
  Map<String, dynamic> lang;
  double area;
  String? flags;
  List time;
  List continents;
  String? subregion;
  String? region;

  Info({
    required this.countries,
    required this.population,
    required this.capital,
    required this.lang,
    required this.time,
    required this.area,
    required this.continents,
    required this.subregion,
    required this.region,
    required this.flags,
  });

  factory Info.formMap(
      {required String common,
        required int population,
        required List capital,
        required Map<String, dynamic> languages,
        required List time,
        required double area,
        required List continents,
        required String? subregion,
        required String? region,
        required String? flags,

      }) {
    return Info(
      countries: common,
      population: population,
      capital: capital,
      lang: languages,
      time: time,
      area: area,
      continents: continents,
      subregion: subregion,
      region: region,
      flags: flags,
    );
  }
}