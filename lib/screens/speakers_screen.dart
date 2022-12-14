import 'dart:convert';

import 'package:conference_app/models/speaker.dart';
import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpeakerAll extends StatefulWidget {
  const SpeakerAll({Key? key}) : super(key: key);

  @override
  State<SpeakerAll> createState() => _SpeakerAllState();
}

class _SpeakerAllState extends State<SpeakerAll> {
  Future<List<Speaker>> _getNetworkSpeakers() async {
    var endpointUrl = Uri.parse(
        'https://63848d3a4ce192ac605b092f.mockapi.io/api/v1/speakers');
    // api get call
    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      // decode json
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      // get individual
      final List<Speaker> _speakers = decodedList.map((e) {
        return Speaker.fromJson(e);
      }).toList();
      // print(_speakers[0].imageUrl);

      return _speakers;
    } else {
      throw Exception('Unable to fetch Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // _getNetworkSpeakers();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: BrandColor.secondaryColorDark,
        title: Text('Speakers'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _getNetworkSpeakers().toString().length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: FutureBuilder<List<Speaker>>(
                future: _getNetworkSpeakers(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Speaker>> snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                        snapshot.data![index].imageUrl.toString());
                  }
                  return Center(child: Text('loading....'));
                },
              ),
            );
          }),
    );
  }
}
