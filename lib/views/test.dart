import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}
int value = 0;
class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
                            padding: const EdgeInsets.only(bottom: -10),
                            child: IconButton(
                              iconSize: 20,
                              icon: const Icon(Icons.arrow_circle_down),
                              tooltip: 'Decrease by one minute',
                              onPressed: () => value += 1 ,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: -10),
                            child: IconButton(
                              iconSize: 20,
                              
                              icon: const Icon(Icons.arrow_circle_up),
                              tooltip: 'Increase by one minute',
                              onPressed: () => value -= 1,
                            ),
                          ),
        ],
      ),
    );
  }
}