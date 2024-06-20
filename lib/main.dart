import 'package:auto_size_text/auto_size_text.dart';
import 'package:contrast_shower_companion/boxes.dart';
import 'package:contrast_shower_companion/sessionshistory.dart';
import 'package:flutter/material.dart';
import 'package:contrast_shower_companion/views/user_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SessionshistoryAdapter());

  boxSessions = await Hive.openBox<Sessionshistory>('sessionBox');

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// class UserPreferences {
//   String hotWaterDuration;
//   String coldWaterDuration;
//   String numberOfCycles;

//   UserPreferences(this.hotWaterDuration, this.coldWaterDuration, this.numberOfCycles);
// }

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
    final items = List<String>.generate(10, (i) => 'Session $i');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      /// Prevents the widget from resizing when the keyboard appears
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        //fit: StackFit.expand,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 3),
                child: Container(
                  ///alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.brown),
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 243, 235, 235),
                  ),
                  height: screenHeight * 0.30,// 260,
                  width: screenWidth * 0.39,
                  //width: 155,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Total time (min.)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Hot Water (min.)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Cold Water (min.)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'No. of Cycles',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                    height: screenHeight * 0.30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(color: Colors.grey),
                              top: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey),
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          width: screenWidth * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoSizeText(
                                items[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                items[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                items[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                items[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                items[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment(0.0, -0.5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TimingWidget()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.all(13)), // Adjust padding as needed:
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
          ),
        ],
      ),
    );
  }
}
