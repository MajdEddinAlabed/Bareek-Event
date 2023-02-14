import 'dart:convert';

class EventModel {
  EventModel({
    this.eventId = 0,
    this.place = '',
    this.reocuerance = '',
    this.date,
    this.organizer = '',
    this.description = '',
  });

  final int eventId;
  final String place;
  final String reocuerance;
  final DateTime? date;
  final String organizer;
  final String description;

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventId: json["eventId"] ?? 0,
        place: json["place"],
        reocuerance: json["reocuerance"],
        date: DateTime.parse(json["date"]),
        organizer: json["organizer"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "place": place,
        "reocuerance": reocuerance,
        "date": date?.toIso8601String(),
        "organizer": organizer,
        "description": description,
      };
}
