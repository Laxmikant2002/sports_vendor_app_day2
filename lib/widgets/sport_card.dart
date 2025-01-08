import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/sport.dart';

class SportCard extends StatelessWidget {
  final Sport sport;
  final VoidCallback onTap;

  const SportCard({required this.sport, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.sports),
        title: Text(sport.name),
        subtitle: Text(sport.description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
