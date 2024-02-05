import 'package:fasting_app/widgets/fasting_type_card.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key, this.isEdited = false});

  final bool isEdited;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Rozpocznij post!",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            FastingTypeCard(fastingType: 12),
            FastingTypeCard(fastingType: 14),
            FastingTypeCard(fastingType: 16),
            FastingTypeCard(fastingType: 20),
          ],
        ),
      ),
    );
  }
}
