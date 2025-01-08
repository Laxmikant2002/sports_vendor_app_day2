import 'package:flutter/material.dart';
import 'package:sports_vendor_app/app/view/app.dart';
import 'package:sports_vendor_app/utils/theme.dart';
import 'package:sports_vendor_app/bootstrap.dart';

void main() {
  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: appTheme,
      home: const App(),
    );
  }
}
