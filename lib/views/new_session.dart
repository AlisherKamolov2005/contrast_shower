import 'package:contrast_shower_companion/main.dart';
import 'package:flutter/material.dart';

class TimingWidget extends StatefulWidget {
  const TimingWidget({super.key});

  @override
  State<TimingWidget> createState() => _TimingWidgetState();
}

class _TimingWidgetState extends State<TimingWidget> {
  final _hotPhaseController  = TextEditingController(text: '3');
  final _coldPhaseController  = TextEditingController(text: '1');
  final _cyclesController  = TextEditingController(text: '3');

  void _incrementControllerValue(TextEditingController controller) {
    final int value = int.tryParse(controller.text) ?? 0;
    controller.text = (value + 1).toString();
  }
  void _decrementControllerValue(TextEditingController controller) {
    final int value = int.tryParse(controller.text) ?? 0;
    if(value > 0) {
      controller.text = (value - 1).toString();
    }
  }

  @override
  void dispose() {
    _hotPhaseController.dispose();
    _coldPhaseController.dispose();
    _cyclesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Contrast Shower',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Set Durations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
              
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _hotPhaseController,
                    autocorrect: false,
                    enableSuggestions: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Hot Water (minutes)',
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
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 165,
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
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Cold Water (minutes)',
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
          Positioned(
            top: 230,
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
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Number of Cycles',
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
          Positioned(
            bottom: 100,
            right: 125,
            left: 125,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'History', 
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