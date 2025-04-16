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
      debugShowCheckedModeBanner: false,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ResponsiveText(
            title,
            maxFontSize: 28,
            minFontSize: 18,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const ResponsiveGap(mobile: 16),
          ResponsiveRow(
            children: [
              ResponsiveCol(
                xs: 12,
                md: 6,
                child: ResponsivePadding(
                  mobile: 8,
                  child: Container(
                    height: 120,
                    color: Colors.amber,
                    child: const Center(child: Text('Column 1')),
                  ),
                ),
              ),
              ResponsiveCol(
                xs: 12,
                md: 6,
                child: ResponsivePadding(
                  mobile: 8,
                  child: Container(
                    height: 120,
                    color: Colors.teal,
                    child: const Center(child: Text('Column 2')),
                  ),
                ),
              ),
            ],
          ),
          const ResponsiveGap(mobile: 24),
          ResponsiveAlign(
            mobile: Alignment.center,
            tablet: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blueGrey,
              child: const Text(
                'Responsive Align Example',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const ResponsiveGap(mobile: 24),
          ResponsiveMargin(
            mobile: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.deepPurple,
              child: const Text(
                'This container has responsive margin',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
