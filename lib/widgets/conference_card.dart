import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

class ConfCard extends StatelessWidget {
  final String title;
  final String dates;
  final String imageUrl;
  final String description;

  const ConfCard({
    Key? key,
    required this.title,
    required this.dates,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: BrandColor.secondaryColor,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Text(dates),
            trailing: Icon(Icons.favorite_outline),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: NetworkImage(
                  imageUrl ?? "http://via.placeholder.com/640x480"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: TextStyle(color: BrandColor.secondaryColorLight),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: Text(
                  'View More',
                  style: TextStyle(color: BrandColor.primaryColor),
                ),
                onPressed: () {/* ... */},
              ),
            ],
          )
        ],
      ),
    );
  }
}
