import 'package:fasting_app/pages/initial_page.dart';
import 'package:fasting_app/widgets/stopwatch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.fastingDuration});

  final int fastingDuration;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Post przerywany",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
          child: Column(
            children: [
              Stoper(fastingDuration: fastingDuration),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const InitPage()),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * 0.8, height * 0.06),
                    backgroundColor: Colors.black),
                child: const Text(
                  "Zakończ post",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: width * 0.8,
                height: height * 0.35,
                child: Card(
                  color: Colors.grey.shade200,
                  elevation: 3,
                    child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Złote rady podczas postu:",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Stopniowo wydłużaj post",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Pij dużo wody",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Unikaj przetworzonego jedzenia",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Bądź elastyczny z planem",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
