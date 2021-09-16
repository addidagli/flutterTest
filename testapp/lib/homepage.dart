import 'package:flutter/material.dart';
import 'package:testapp/tickets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Departure Times",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Divider(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.all(2),
                      child: ListTile(
                        leading: Icon(Icons.nightlight_round),
                        title: Row(
                          children: [
                            Text(
                              "Stutgart-Berlin /",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "22:00-06:15",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "Monday-Tuesday-Wednesday-Thursday",
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
              visible: false,
              child: Center(
                child: Container(
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 24),
                          ),
                          Padding(
                            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText:
                                      'Enter valid email id as abc@gmail.com'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter secure password'),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()));
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
}

/*Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80'),
              fit: BoxFit.fill,
        ),
            ),
                )
              ),
              Text("Departure Times",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24),),
              Divider(height: 5,),
              Expanded(child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(2),
                child: ListTile(
                  leading: Icon(Icons.nightlight_round),
                  title: Row(children: [
                    Text("Stutgart-Berlin /",style: TextStyle(fontWeight: FontWeight.w700),),
                    Text("22:00-06:15",style: TextStyle(fontWeight: FontWeight.w700),),
                  ],),
                  subtitle: Text("Monday-Tuesday-Wednesday-Thursday",),
                ),
              ),
            ),)   
        ],),
      ), */
