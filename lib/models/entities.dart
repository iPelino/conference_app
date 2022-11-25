class Conference {
  String title;
  String description;
  String? imageUrl;
  DateTime startDate;
  DateTime endDate;

  Conference({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.startDate,
    required this.endDate,
  });
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
