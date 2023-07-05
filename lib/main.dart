import 'package:country_detail_app/screens/detail_page.dart';
import 'package:country_detail_app/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        'detail': (context) => const DetailsPage(),
      },
    ),
  );
}
