import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/vendor.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;
  final VoidCallback onTap;

  const VendorCard({required this.vendor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.store),
        title: Text(vendor.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating: ${vendor.rating}'),
            Text('Price: \$${vendor.price.toStringAsFixed(2)}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
