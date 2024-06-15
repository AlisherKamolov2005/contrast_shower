import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimingWidget extends StatefulWidget {
  const TimingWidget({super.key});

  @override
  State<TimingWidget> createState() => _TimingWidgetState();
}

class _TimingWidgetState extends State<TimingWidget> {
  final _hotPhaseController  = TextEditingController(text: '3');
  final _coldPhaseController  = TextEditingController(text: '1');
  final _cyclesController  = TextEditingController(text: '3');
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
    _hotPhaseController.addListener(_updateTotalTime);
    _coldPhaseController.addListener(_updateTotalTime);
    _cyclesController.addListener(_updateTotalTime);
    super.initState();
  }

  void _incrementControllerValue(TextEditingController controller) {
    final int value = int.tryParse(controller.text) ?? 0;
    setState(() {
      controller.text = (value + 1).toString();            
    });
  }
  void _decrementControllerValue(TextEditingController controller) {
    final int value = int.tryParse(controller.text) ?? 0;
    if(value > 0) {
      setState(() {
        controller.text = (value - 1).toString();          
      });
    }
  }

  int get(TextEditingController controller) {
    final int value = int.tryParse(controller.text) ?? 0;
    return value;
  }

  void _updateTotalTime() {
    setState(() {});
  }

  @override
  void dispose() {
    // Remove the listeners
    _hotPhaseController.removeListener(_updateTotalTime);
    _coldPhaseController.removeListener(_updateTotalTime);
    _cyclesController.removeListener(_updateTotalTime);
    
    // Dispose the controllers
    _hotPhaseController.dispose();
    _coldPhaseController.dispose();
    _cyclesController.dispose();
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Session Preferences',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: [
          Text(timerText),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'Total time: ${(get(_hotPhaseController) + get(_coldPhaseController)) * get(_cyclesController)} min',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
          ),
          
          /// Hot Water Duration
          Positioned(
            top: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _hotPhaseController,
                        autocorrect: false,
                        enableSuggestions: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelText: 'Hot Water (minutes)',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.remove_circle_outline),
                                color: Colors.red,
                                tooltip: 'Decrease by one minute',
                                onPressed: () => _decrementControllerValue(_hotPhaseController),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.add_circle_outline),
                                color: Colors.green,
                                tooltip: 'Increase by one minute',
                                onPressed: () => _incrementControllerValue(_hotPhaseController),
                              ),
                            ],
                          ), 
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),

          /// Cold Water Duration
          Positioned(
            top: 200,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  
                  child: TextField(
                    controller: _coldPhaseController,
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ), 
                      labelText: 'Cold Water (minutes)',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Colors.red,
                            tooltip: 'Decrease by one minute',
                            onPressed: () => _decrementControllerValue(_coldPhaseController),
                          ),
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.add_circle_outline),
                            color: Colors.green,
                            tooltip: 'Increase by one minute',
                            onPressed: () => _incrementControllerValue(_coldPhaseController),
                          ),
                        ],
                      ), 
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Number of Cycles
          Positioned(
            top: 280,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _cyclesController,
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      labelText: 'Number of Cycles',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.remove_circle_outline),
                            color: Colors.red,
                            tooltip: 'Decrease by one minute',
                            onPressed: () => _decrementControllerValue(_cyclesController),
                          ),
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.add_circle_outline),
                            color: Colors.green,
                            tooltip: 'Increase by one minute',
                            onPressed: () => _incrementControllerValue(_cyclesController),
                          ),
                        ],
                      ), 
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Begin Session button
          Positioned(
            top: 400,
            child: ElevatedButton(
              onPressed: () {
                  ///_incrementControllerValue(_coldPhaseController); //get(_coldPhaseController) += 1;
                setState(() {
                  startTimer();    
                });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const TestWidget()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Begin Session', 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}