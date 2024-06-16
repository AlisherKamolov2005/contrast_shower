import 'package:flutter/material.dart';

class CoveringWidgetExample extends StatefulWidget {
  @override
  _CoveringWidgetExampleState createState() => _CoveringWidgetExampleState();
}

class _CoveringWidgetExampleState extends State<CoveringWidgetExample> {
  bool _isCoveringVisible = false;

  void _toggleCoveringVisibility() {
    setState(() {
      _isCoveringVisible = !_isCoveringVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your main content widgets here
        Center(
          child: ElevatedButton(
            onPressed: _toggleCoveringVisibility,
            child: Text('Show Full Screen Widget'),
          ),
        ),
        // Conditionally show covering widget
        if (_isCoveringVisible)
          Container(
            color: Colors.black,
            child: Center(
              child: ElevatedButton(
                onPressed: _toggleCoveringVisibility,
                child: Text('Close'),
              ),
            ),
          ),
      ],
    );
  }
}
