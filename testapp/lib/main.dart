import 'package:flutter/material.dart';
import 'package:testapp/ui/mainPage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => MainPage(),
        //'/bildirim': (context) => Bildirim(),
      },
      debugShowCheckedModeBanner: false,

      //home: NavigasyonIslemleri()
    ),
  );
}