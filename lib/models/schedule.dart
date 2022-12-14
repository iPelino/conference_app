import 'package:conference_app/models/speaker.dart';

import 'conference.dart';

class Schedule {
  String topic;
  Speaker speaker;
  String start;
  String end;
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
