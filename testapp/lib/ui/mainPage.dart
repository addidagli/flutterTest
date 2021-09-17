import 'package:flutter/material.dart';
import 'package:testapp/ui/globals.dart';
import 'package:testapp/ui/tickets.dart';

import 'homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar;
  HomePage homepage;
  Tickets tickets;

  
  @override
  void initState() {
    super.initState();
    homepage = HomePage();
    tickets = Tickets();
    tumSayfalar = [homepage, tickets];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(tumSayfalar[secilenMenuItem].toString()),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.train),
        ),
      ),
      body: tumSayfalar[secilenMenuItem],
       bottomNavigationBar: bottomNavMenu(),
    );
  }
  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("HomeScreen"),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file_sharp),
              title: Text("Tickets"),
              backgroundColor: Colors.teal),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: secilenMenuItem,
        fixedColor: Colors.orange,
        onTap: (index) {
          setState(() {
            if(isLoggedIn)
            {
              secilenMenuItem = index;
            }else {
              secilenMenuItem = 0;
            }
          });
        },
      ),
    );
  }
}