import 'dart:async';
import 'package:contrast_shower_companion/views/new_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContrastShowerCycle extends ConsumerStatefulWidget {
  const ContrastShowerCycle({super.key});

  @override
  _ContrastShowerCycleState createState() => _ContrastShowerCycleState();
}


class _ContrastShowerCycleState extends ConsumerState<ContrastShowerCycle> {
  bool _newSession = false;
  Timer? _timer;
  int _start = 180; /// Default number of seconds

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, 
      (Timer timer) {
        if(_start == 0) {
          setState(() {
            timer.cancel();
            //_start = ref.;//get(_hotPhaseController) * 60;
            clicked();
          });
        } else {
          setState(() {
            _start --;
          });
        }
      }
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
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

  void clicked() {
    setState(() {
      _newSession = !_newSession;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: Text(timerText),
            ),
          ),
          if(_newSession)
            Container(
              color: Colors.blue,
              child: Center(
                child: Text(timerText),
              ),
            ),
        ],
      ),
    );
  }
}