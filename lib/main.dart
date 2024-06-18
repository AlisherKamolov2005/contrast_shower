import 'package:flutter/material.dart';
import 'package:contrast_shower_companion/views/user_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class ShowerSession {
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contrast Showering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        //alignment: const Alignment(0.0, 0.4),
        children: [
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {},
          ),
          Positioned(
            bottom: 100,
            right: 75,
            left: 75,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimingWidget()),
                );
              },
              backgroundColor: Colors.red,
              child: const Text(
                'Start New Session',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
