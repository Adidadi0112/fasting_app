import 'package:fasting_app/pages/home.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key, this.isEdited = false});

  final bool isEdited;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
                  children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(
                  ),
                ),
              ),
              child: const Text('5'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(
                  ),
                ),
              ),
              child: const Text('10'),
            ),
                  ],
                ),
          ),
        ));
  }
}
