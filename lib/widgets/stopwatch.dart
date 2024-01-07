import 'dart:async';
import 'package:fasting_app/pages/initial_page.dart';
import 'package:flutter/material.dart';

class Stoper extends StatefulWidget {
  @override
  _StoperState createState() => _StoperState();

  const Stoper({Key? key, required this.fastingDuration}) : super(key: key);

  final int fastingDuration;
}

class _StoperState extends State<Stoper> {
  late Stopwatch _stopwatch;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_stopwatch.isRunning) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final elapsedTimeInSeconds = _stopwatch.elapsed.inSeconds;
    final totalDurationInSeconds =
        widget.fastingDuration * 60 * 60; 

    final percentageElapsed =
        (elapsedTimeInSeconds / totalDurationInSeconds) * 100;

    final time =
        '${_stopwatch.elapsed.inHours.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: height * 0.36,
          width: width * 0.75,
          child: CircularProgressIndicator(
            value: percentageElapsed / 100,
            backgroundColor: Colors.grey,
            color: Colors.deepPurple,
            strokeWidth: 10,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Text(time, style: TextStyle(fontSize: 40)),
                  Text('${percentageElapsed.toStringAsFixed(1)}%'),
                  IconButton(
                    onPressed: () {
                      if (_stopwatch.isRunning) {
                        _stopwatch.stop();
                        _stopwatch.reset();
                        setState(() {});
                      } else {
                        _stopwatch.start();
                        _startTimer();
                      }
                    },
                    iconSize: 40,
                    icon: Icon(
                        _stopwatch.isRunning ? Icons.stop : Icons.play_arrow),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.1, left: width * 0.50),
          child: IconButton(
            icon: const Icon(Icons.change_circle, size: 30),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InitPage(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
