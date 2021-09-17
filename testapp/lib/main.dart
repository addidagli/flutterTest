import 'package:flutter/material.dart';
import 'package:testapp/ui/mainPage.dart';

import 'ui/homepage.dart';

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