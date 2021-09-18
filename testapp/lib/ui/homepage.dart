import 'package:flutter/material.dart';
import 'package:testapp/models/route.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/ui/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _visible = true;
  bool _isLoading = false;
  bool _checklogin = false;
  String _message = "";

  Ticket ticket;

  Future<Ticket> _gonderiGetir() async {
    var response = await http.get(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes");
    if (response.statusCode == 200) {
      return Ticket.fromJson(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint("addi");
    _gonderiGetir().then((okunanGonderi) {
      ticket = okunanGonderi;
    });
  }

  void change() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: isLoggedIn ? 1 : 0.3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          child: Container(
                              child: Text(
                            'Explore our Destinations',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Departure Times",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Divider(
                    height: 5,
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: _gonderiGetir(),
                    builder:
                        (BuildContext context, AsyncSnapshot<Ticket> snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: snapshot.data.data
                              .map((doc) => Card(
                                    child: Container(
                                      child: ListTile(
                                        leading: Icon(Icons.nightlight_round),
                                        title: Row(
                                          children: [
                                            Text(
                                              doc.route + " / ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              doc.departureTime +
                                                  "-" +
                                                  doc.arrivalTime,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        subtitle: Text(
                                          doc.daysOfWeek.toString(),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
          Positioned(
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: isLoggedIn ? false : true,
              child: Center(
                child: Container(
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 24),
                          ),
                          Visibility(
                            visible: _checklogin,
                            child: Text(
                              _message,
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ),
                          Form(
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                TextField(
                                  controller: _mailController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText: 'abc@gmail.com',
                                      labelStyle:
                                          TextStyle(color: Colors.orange)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'password',
                                      labelStyle:
                                          TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20)),
                            child: FlatButton(
                              onPressed: () {
                                signIn(_mailController.text,
                                    _passwordController.text);
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  signIn(String email, String pass) async {
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    debugPrint("email: " + email + " pass: " + pass);
    var response = await http.post(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/login",
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      userid = jsonResponse['data']['userId'];
      debugPrint(jsonResponse.toString());

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
          _checklogin = false;
          isLoggedIn = true;
          change();
        });
      }
    } else {
      jsonResponse = json.decode(response.body);
      _message = jsonResponse['message'];
      setState(() {
        _isLoading = false;
        _checklogin = true;
      });
    }
  }
}
