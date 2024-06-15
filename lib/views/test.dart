import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerApp extends StatefulWidget {
  const CountdownTimerApp({super.key});

  @override
  _CountdownTimerAppState createState() => _CountdownTimerAppState();
}

class _CountdownTimerAppState extends State<CountdownTimerApp> {
  Timer? _timer;
  int _start = 300; // Countdown duration in seconds (e.g., 5 minutes)

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: Text(
          timerText,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
