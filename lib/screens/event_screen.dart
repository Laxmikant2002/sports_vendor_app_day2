import 'package:flutter/material.dart';
import 'package:sports_vendor_app/utils/constants.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    required this.vendorName,
    this.numberOfTickets = defaultTickets,
    this.personName = defaultName,
    this.ageRate = defaultAgeRate,
    this.pay = defaultTicketPrice,
    super.key,
  });
  final String vendorName;
  final int numberOfTickets;
  final String personName;
  final String ageRate;
  final double pay;

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late int numberOfTickets;
  late String personName;
  late String ageRate;
  late double totalPay;

  @override
  void initState() {
    super.initState();
    numberOfTickets = widget.numberOfTickets;
    personName = widget.personName;
    ageRate = widget.ageRate;
    totalPay = widget.pay * numberOfTickets;
  }

  void _updateTotalPay() {
    setState(() {
      totalPay = widget.pay * numberOfTickets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event for ${widget.vendorName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.store),
                title: Text(
                  'Selected Sponsor: ${widget.vendorName}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.confirmation_number),
                title: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (numberOfTickets > 1) {
                          setState(() {
                            numberOfTickets--;
                            _updateTotalPay();
                          });
                        }
                      },
                    ),
                    Text(
                      'Number of Tickets: $numberOfTickets',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          numberOfTickets++;
                          _updateTotalPay();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.person),
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Person Name',
                  ),
                  controller: TextEditingController(text: personName),
                  onChanged: (value) {
                    setState(() {
                      personName = value;
                    });
                  },
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.cake),
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Age Rate',
                  ),
                  controller: TextEditingController(text: ageRate),
                  onChanged: (value) {
                    setState(() {
                      ageRate = value;
                    });
                  },
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text(
                  'Total Pay: \$${totalPay.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality here
                },
                child: Text('Purchase Tickets'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
