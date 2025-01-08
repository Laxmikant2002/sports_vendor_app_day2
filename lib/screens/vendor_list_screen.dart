import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/vendor.dart' as model;
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/screens/event_screen.dart' as screen;
import 'package:sports_vendor_app/services/data_service.dart';
import 'package:sports_vendor_app/widgets/vendor_card.dart' as widget;

class VendorListScreen extends StatelessWidget {
  final Sport sport;

  const VendorListScreen({required this.sport, super.key});

  @override
  Widget build(BuildContext context) {
    final dataService = DataService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors for ${sport.name}'),
      ),
      body: FutureBuilder<List<model.Vendor>>(
        future: dataService.fetchVendors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error loading vendors.'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Retry fetching vendors
                      dataService.fetchVendors();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          final vendors = snapshot.data ?? [];
          return RefreshIndicator(
            onRefresh: () async {
              // Refresh the list of vendors
              await dataService.fetchVendors();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: vendors.length,
                    itemBuilder: (context, index) {
                      return widget.VendorCard(
                        vendor: vendors[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screen.EventScreen(
                                vendorName: vendors[index].name,
                                numberOfTickets: 1, // Default value
                                personName: 'John Doe', // Default value
                                ageRate: 'All Ages', // Default value
                                pay: vendors[index].price, // Vendor price
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: vendors.length,
                    itemBuilder: (context, index) {
                      return widget.VendorCard(
                        vendor: vendors[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screen.EventScreen(
                                vendorName: vendors[index].name,
                                numberOfTickets: 1, // Default value
                                personName: 'John Doe', // Default value
                                ageRate: 'All Ages', // Default value
                                pay: vendors[index].price, // Vendor price
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
