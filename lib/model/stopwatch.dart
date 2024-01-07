import 'dart:async';
import 'package:flutter/foundation.dart';

class StopwatchModel extends ChangeNotifier {
  late Stopwatch _stopwatch;
  late Timer _timer;
  int _fastingDuration;

  StopwatchModel(this._fastingDuration) : _stopwatch = Stopwatch();

  int get fastingDuration => _fastingDuration;

  bool get isRunning => _stopwatch.isRunning;

  Duration get elapsed => _stopwatch.elapsed;

  void startStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
      _startTimer();
    }
    notifyListeners();
  }

  void resetStopwatch() {
    _stopwatch.reset();
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_stopwatch.isRunning) return;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
