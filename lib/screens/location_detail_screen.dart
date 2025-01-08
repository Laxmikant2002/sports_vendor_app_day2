import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/location.dart';

class LocationDetailScreen extends StatelessWidget {
  final Location location;

  const LocationDetailScreen({required this.location, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${location.id}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Name: ${location.name}', style: TextStyle(fontSize: 18)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
