import 'package:contrast_shower_companion/views/test.dart';
import 'package:flutter/material.dart';
import 'package:contrast_shower_companion/views/new_session.dart';

void main() {
  runApp(const MiddleAssigmentApp());
}

class MiddleAssigmentApp extends StatelessWidget {
  const MiddleAssigmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Middle Assigment',
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
        backgroundColor: Colors.blue,
      ),
      body: Stack(
            //alignment: const Alignment(0.0, 0.4),
            children: [
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {  },
              ),  
              Positioned(
                bottom: 100,
                right: 75,
                left: 75,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimingWidget()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue,
                  ),
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