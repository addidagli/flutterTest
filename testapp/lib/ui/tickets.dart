import 'package:flutter/material.dart';
import 'package:testapp/models/ticketinfo.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/ui/globals.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key key}) : super(key: key);

  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  TicketInfo ticket;

  Future<TicketInfo> _gonderiGetir() async {
    var response = await http.get(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/${userid}/ticket");
    if (response.statusCode == 200) {
      return TicketInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    _gonderiGetir().then((okunanGonderi) {
      ticket = okunanGonderi;
    });
  }

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
          child: FutureBuilder(
            future: _gonderiGetir(),
            builder:
                (BuildContext context, AsyncSnapshot<TicketInfo> snapshot) {
              if (snapshot.hasData) {
                return Card(
                  elevation: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Departure Time",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.departureTime,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Arrival Time",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.arrivalTime,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                snapshot.data.data.departureCity,
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.departureBusStop,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "- - - - ->- - - - -",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                snapshot.data.data.arrivalCity,
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.arrivalBusStop,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Passenger",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.passengerName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Seat",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Container(
                                  child: Text(
                                    snapshot.data.data.seatNu,
                                    style: TextStyle(
                                        decorationColor: Colors.white12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 24),
                                  ),
                                  decoration: ShapeDecoration(
                                    color: Colors.orange,
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                          width: 2.0, color: Colors.orange),
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Tour Number",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.tourNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Date",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.date,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Ticket Number",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.ticketNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Booking Number",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Text(
                                snapshot.data.data.bookingNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          QrImage(
                            data: snapshot.data.data.qrCode,
                            size: 100,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
/*Row(
                        
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            snapshot.data.data.passengerName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Container(
                              child: Text(
                                snapshot.data.data.seatNu,
                                style: TextStyle(
                                    decorationColor: Colors.white12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                              decoration: ShapeDecoration(
                                color: Colors.orange,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      width: 2.0, color: Colors.orange),
                                ),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            snapshot.data.data.tourNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            snapshot.data.data.date,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ), */
