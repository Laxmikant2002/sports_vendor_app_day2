import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/widgets/sport_card.dart';
import 'package:sports_vendor_app/screens/vendor_list_screen.dart';

class SportListScreen extends StatelessWidget {
  final Location location;

  const SportListScreen({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of sports
    final sports = [
      Sport(
          name: 'Soccer',
          description: 'A team sport played with a spherical ball.'),
      Sport(
          name: 'Basketball',
          description:
              'A team sport where players try to score by shooting a ball through a hoop.'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Sports List for ${location.name}'),
      ),
      body: ListView.builder(
        itemCount: sports.length,
        itemBuilder: (context, index) {
          return SportCard(
            sport: sports[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorListScreen(sport: sports[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
