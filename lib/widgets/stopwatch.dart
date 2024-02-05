import 'dart:async';
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
  bool isFasting = true;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _stopwatch.start();
    _startTimer();
    _checkStoperCompletion();
  }

  void _checkStoperCompletion() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_stopwatch.elapsed.inSeconds >= widget.fastingDuration * 60 * 60) {
        isFasting = false;
        _stopwatch.reset();
      }
      if (!isFasting) {
        if (_stopwatch.elapsed.inSeconds >=
            24 * 60 * 60 - widget.fastingDuration * 60 * 60) {
          _stopwatch.stop();
          timer.cancel();
        }
      }
    });
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
    final totalDurationInSeconds = widget.fastingDuration * 60 * 60;
    final eatingDuration = 24 * 60 * 60 - totalDurationInSeconds;

    final percentageElapsed = (elapsedTimeInSeconds /
            (isFasting ? totalDurationInSeconds : eatingDuration)) *
        100;

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
            color: Colors.black,
            strokeWidth: 10,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isFasting
                  ? const Icon(
                      Icons.timer_outlined,
                      size: 50,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.fastfood_outlined,
                      size: 50,
                      color: Colors.black,
                    ),
              Text(time, style: const TextStyle(fontSize: 40, color: Colors.black)),
              Text('${percentageElapsed.toStringAsFixed(1)}%', style: const TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(height: 30)
            ],
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
