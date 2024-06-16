import 'dart:async';
import 'package:contrast_shower_companion/views/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';


class ContrastShowerCycle extends ConsumerStatefulWidget {
  const ContrastShowerCycle({super.key});

  @override
  _ContrastShowerCycleState createState() => _ContrastShowerCycleState();
}

class _ContrastShowerCycleState extends ConsumerState<ContrastShowerCycle> {
  bool _newSession = true;
  Timer? _timer;
  late int _start;
  int numberOfCycles = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, 
      (Timer timer) {
        if(_start == 0) {
          setState(() {
            timer.cancel();
            
            final cyclePhase = int.tryParse(ref.read(cyclesProvider) ) ?? 0;
            numberOfCycles ++;
            if(numberOfCycles < cyclePhase * 2) {
              clicked();
            }
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
    super.initState();

    ///Ensures the provided callback is called after the widget has been fully built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clicked();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0'); 
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  

  void clicked() {
    final hotPhase = ref.read(hotPhaseProvider);
    final coldPhase = ref.read(coldPhaseProvider);

    setState(() {
      if(!_newSession) {
        _start = int.tryParse(coldPhase)! * 60;
      } else {
        _start = int.tryParse(hotPhase)! * 60;
      }
      _newSession = !_newSession;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final hotPhase = int.tryParse(ref.read(hotPhaseProvider))! * 60;
    final coldPhase = int.tryParse(ref.read(coldPhaseProvider))! * 60;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(243, 221, 23, 9),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100.0), 
                  child: Text(
                    'Hot Water',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 157), 
                  child: Text(
                    '${(hotPhase ~/ 60).toString().padLeft(2, '0')}:${(hotPhase % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),

                Center(
                  child: AutoSizeText(
                    timerText,
                    style: const TextStyle(
                      fontSize: 150,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 700), 
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    width: 350,
                    height: 133,
                    child: const Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 17),
                          child: Text(
                            'Next Phase\n',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Cold Water',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(_newSession)
            Container(
              color: Colors.blue,
              child: Center(
                child: AutoSizeText(
                timerText,
                style: const TextStyle(
                  fontSize: 150,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
                //_start = //ref.;//get(_hotPhaseController) * 60;
              ),
            ),
        ],
      ),
    );
  }
}