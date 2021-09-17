// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
    Ticket({
        this.status,
        this.success,
        this.message,
        this.data,
    });

    int status;
    bool success;
    String message;
    List<Routess> data;

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        status: json["status"] == null ? null : json["status"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<Routess>.from(json["data"].map((x) => Routess.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Routess {
    Routess({
        this.route,
        this.departureTime,
        this.arrivalTime,
        this.tourType,
        this.daysOfWeek,
    });

    String route;
    String departureTime;
    String arrivalTime;
    String tourType;
    List<String> daysOfWeek;

    factory Routess.fromJson(Map<String, dynamic> json) => Routess(
        route: json["route"] == null ? null : json["route"],
        departureTime: json["departureTime"] == null ? null : json["departureTime"],
        arrivalTime: json["arrivalTime"] == null ? null : json["arrivalTime"],
        tourType: json["tourType"] == null ? null : json["tourType"],
        daysOfWeek: json["daysOfWeek"] == null ? null : List<String>.from(json["daysOfWeek"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "route": route == null ? null : route,
        "departureTime": departureTime == null ? null : departureTime,
        "arrivalTime": arrivalTime == null ? null : arrivalTime,
        "tourType": tourType == null ? null : tourType,
        "daysOfWeek": daysOfWeek == null ? null : List<dynamic>.from(daysOfWeek.map((x) => x)),
    };
}
