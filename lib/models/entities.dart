class Conference {
  String id;
  String title;
  String description;
  String? imageUrl;
  String startDate;
  String endDate;

  Conference({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.startDate,
    required this.endDate,
  });

  factory Conference.fromJson(Map<String, dynamic> json) {
    // TODO: implement Conference.fromJson
    return Conference(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        startDate: json['startDate'],
        endDate: json['endDate']);
  }
}

class Speaker {
  String firstName;
  String lastName;
  String? imageUrl;

  Speaker({
    required this.firstName,
    required this.lastName,
    this.imageUrl,
  });
}

class Schedule {
  String topic;
  Speaker speaker;
  DateTime start;
  DateTime end;
  String? room;
  Conference conference;

  Schedule({
    required this.topic,
    required this.speaker,
    required this.start,
    required this.end,
    this.room,
    required this.conference,
  });
}
