import 'dart:convert';
import 'dart:core';

import 'package:conference_app/models/entities.dart';
import 'package:flutter/services.dart';

class Utils {
  static loadConferences() async {
    // load  json string from assets
    final response = await rootBundle.loadString('assets/conferences.json');
    // decode the json response
    final List<dynamic> decodedList = jsonDecode(response) as List;
    // get individual conference one by one
    final List<Conference> conferences = decodedList.map((listItem) {
      return Conference.fromJson(listItem);
    }).toList();
    print(conferences.length);
  }
}
