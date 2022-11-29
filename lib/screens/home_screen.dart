import 'dart:convert';

import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/entities.dart';
import '../widgets/conference_card.dart';

class Home extends StatefulWidget {
  // final String username;
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hard coded _conferences
  // final List<Conference> _conferences = [
  //   Conference(
  //       id: "1",
  //       title: "Conference 1",
  //       description: "description",
  //       startDate: "09112022",
  //       endDate: "20122022",
  //       imageUrl: "https://loremflickr.com/640/480"),
  //   Conference(
  //       id: "2",
  //       title: "Conference 2",
  //       description: "description2",
  //       startDate: "09112022",
  //       endDate: "20122022",
  //       imageUrl: "https://loremflickr.com/640/480"),
  //   Conference(
  //       id: "3",
  //       title: "Conference 3",
  //       description: "description3",
  //       startDate: "09112022",
  //       endDate: "20122022",
  //       imageUrl: "https://loremflickr.com/640/480"),
  //   Conference(
  //       id: "4",
  //       title: "Conference 4",
  //       description: "description4",
  //       startDate: "09112022",
  //       endDate: "20122022",
  //       imageUrl: "https://loremflickr.com/640/480"),
  // ];

  // conferences from Json file
  List<Conference> _conferences = [];

  // load conferences from Json file
  _loadConferences() async {
    // load  json string from assets
    final response = await rootBundle.loadString('assets/conferences.json');
    // decode the json response
    final List<dynamic> decodedList = jsonDecode(response) as List;
    // get individual conference one by one
    final List<Conference> conferences = decodedList.map((listItem) {
      return Conference.fromJson(listItem);
    }).toList();
    print(conferences.length); // for debugging purposes

    setState(() {
      // final state of conferences
      _conferences = conferences;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadConferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getting data from login screen
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.primaryColor,
        title: Text('Welcome $username'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: _conferences.length,
              itemBuilder: (BuildContext context, int index) {
                return ConfCard(
                  title: _conferences[index].title,
                  dates:
                      "From ${DateTime.tryParse(_conferences[index].startDate)} "
                      "To ${DateTime.parse(_conferences[index].endDate)}",
                  imageUrl: "https://loremflickr.com/640/480",
                  description: _conferences[index].description,
                );
              })),
    );
  }
}
