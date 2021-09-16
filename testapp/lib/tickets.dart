import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white12,
        ),
        child: Card(
          elevation: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Departure Time",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Arrival Time",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "22:00 pm",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    "11:00 am",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "STU",
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                  Text(
                    "-------->--------",
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                  Text(
                    "BER",
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Stutgart Flughafen",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Berlin ZOB",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Passanger",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Seat",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 16),
                  ),
                  Text(
                    "C4",
                    style: TextStyle(
                        backgroundColor: Colors.orange,
                        decorationColor: Colors.white12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Tour Number",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "XY-1529",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "16-08-2021",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Ticket Number",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("Q2ZPK4"),
                      Text(
                        "Booking Number",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text("TSP2"),
                    ],
                  ),
                  Text("QR gelecek"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
