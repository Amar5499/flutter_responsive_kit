import 'package:flutter/material.dart';
import 'package:flutter_responsive_kit/flutter_responsive_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Kit Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive Kit')),
        body: ResponsiveBuilder(
          mobile: (context) => _buildScreen(context, 'Mobile View'),
          tablet: (context) => _buildScreen(context, 'Tablet View'),
          desktop: (context) => _buildScreen(context, 'Desktop View'),
        ),
      ),
    );
  }

  Widget _buildScreen(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ResponsiveText(
            title,
            maxFontSize: 28,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ResponsiveRow(
            children: [
              ResponsiveCol(
                xs: 12,
                md: 6,
                child: Container(
                  height: 100,
                  color: Colors.amber,
                  child: const Center(child: Text('Column 1')),
                ),
              ),
              ResponsiveCol(
                xs: 12,
                md: 6,
                child: Container(
                  height: 100,
                  color: Colors.teal,
                  child: const Center(child: Text('Column 2')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
