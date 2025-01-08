import 'package:flutter/material.dart';
import 'package:sports_vendor_app/services/data_service.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/widgets/location_card.dart';
import 'package:sports_vendor_app/screens/sports_list_screen.dart';

class LocationListScreen extends StatelessWidget {
  final DataService dataService;

  const LocationListScreen({required this.dataService, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location List'),
      ),
      body: FutureBuilder<List<Location>>(
        future: dataService.fetchLocations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error loading locations.'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Retry fetching locations
                      dataService.fetchLocations();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          final locations = snapshot.data ?? [];
          return ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return LocationCard(
                location: locations[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SportListScreen(location: locations[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
