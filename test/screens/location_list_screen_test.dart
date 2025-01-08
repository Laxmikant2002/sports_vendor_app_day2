import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/models/vendor.dart';
import 'package:sports_vendor_app/screens/location_list_screen.dart';
import 'package:sports_vendor_app/services/data_service.dart';

class MockDataService extends Mock implements DataService {
  @override
  Future<List<Location>> fetchLocations() async {
    return [
      Location(id: '1', name: 'Location 1'),
      Location(id: '2', name: 'Location 2'),
    ];
  }

  @override
  Future<List<Sport>> fetchSports() async {
    return [];
  }

  @override
  Future<List<Vendor>> fetchVendors() async {
    return [];
  }
}

void main() {
  late MockDataService mockDataService;

  setUp(() {
    mockDataService = MockDataService();
    // Register fallback values for Location
    registerFallbackValue(Location(id: '0', name: 'Fallback Location'));
  });

  testWidgets('LocationListScreen displays locations',
      (WidgetTester tester) async {
    final locations = [
      Location(id: '1', name: 'Location 1'),
      Location(id: '2', name: 'Location 2'),
    ];

    when(() => mockDataService.fetchLocations())
        .thenAnswer((_) async => locations);

    await tester.pumpWidget(
      MaterialApp(
        home: LocationListScreen(dataService: mockDataService),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Location 1'), findsOneWidget);
    expect(find.text('Location 2'), findsOneWidget);
  });
}
