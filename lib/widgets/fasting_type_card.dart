import 'package:flutter/material.dart';

import '../pages/home.dart';

class FastingTypeCard extends StatelessWidget {
  const FastingTypeCard({super.key, required this.fastingType});

  final int fastingType;

  @override
  Widget build(BuildContext context) {
    List<Widget> trailingIcons = [];

    if (fastingType == 12) {
      trailingIcons.add(const Icon(Icons.local_fire_department));
      trailingIcons.addAll(List.generate(
          3, (index) => const Icon(Icons.local_fire_department_outlined)));
    } else if (fastingType == 14) {
      trailingIcons.addAll(
          List.generate(2, (index) => const Icon(Icons.local_fire_department)));
      trailingIcons.addAll(List.generate(
          2, (index) => const Icon(Icons.local_fire_department_outlined)));
    } else if (fastingType == 16) {
      trailingIcons.addAll(
          List.generate(3, (index) => const Icon(Icons.local_fire_department)));
      trailingIcons.add(const Icon(Icons.local_fire_department_outlined));
    } else if (fastingType == 20) {
      trailingIcons.addAll(
          List.generate(4, (index) => const Icon(Icons.local_fire_department)));
    }

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(
            fastingDuration: fastingType,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.17,
        child: Card(
          color: Colors.white,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$fastingType - ${24 - fastingType}",
                    style: const TextStyle(
                        fontSize: 33, fontWeight: FontWeight.bold)),
                Row(mainAxisSize: MainAxisSize.min, children: trailingIcons)
              ],
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                    ),
                    const SizedBox(width: 10),
                    Text("$fastingType godzin postu",
                        style: const TextStyle(fontSize: 14))
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 8,
                    ),
                    const SizedBox(width: 10),
                    Text("${24 - fastingType} godzin okienka żywieniowego",
                        style: const TextStyle(fontSize: 14))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
