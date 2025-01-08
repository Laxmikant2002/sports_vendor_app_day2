import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/location.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  const LocationCard({required this.location, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text(location.name),
        subtitle: Text('ID: ${location.id}'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
