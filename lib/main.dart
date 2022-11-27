import 'package:flutter/material.dart';
import 'details_page.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        'detailsPage': (context) => const DetailPage(),
      },
    ),
  );
}