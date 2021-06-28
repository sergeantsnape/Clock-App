import 'package:basics/pages/homepage.dart';
import 'package:basics/pages/loading.dart';
import 'package:basics/pages/loc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => WHome(),
        '/loc': (context) => Location(),
      },
    );
  }
}
