import 'package:auto_size_text/auto_size_text.dart';
import 'package:contrast_shower_companion/boxes.dart';
import 'package:contrast_shower_companion/main.dart';
import 'package:contrast_shower_companion/sessionshistory.dart';
import 'package:contrast_shower_companion/views/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class SessionSummary extends ConsumerWidget {
  const SessionSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotPhase = int.tryParse(ref.read(hotPhaseProvider))!;
    final coldPhase = int.tryParse(ref.read(coldPhaseProvider))!;
    final cyclePhase = int.tryParse(ref.read(cyclesProvider)) ?? 0;
    double sessionRating = 0;
    DateTime now = DateTime.now();
    DateTime todayWithHourAndMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(todayWithHourAndMinute);

      boxSessions.put(
          formattedDate,
          Sessionshistory(
              historyTotalTime: (hotPhase + coldPhase) * cyclePhase,
              historyHotWaterDuration: hotPhase,
              historyColdWaterDuration: coldPhase,
              historyNumberOfCycles: cyclePhase,
              historyRating: sessionRating));
    ///Default value
    // final _mybox = Hive.box('mybox');
    //_mybox.put();

    return Scaffold(
      resizeToAvoidBottomInset: false, /// Prevents the widget from resizing when the keyboard appears
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Session Summary',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),

            ///Total time
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                width: 350,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: AutoSizeText(
                        'Total time:',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AutoSizeText(
                        '${(hotPhase + coldPhase) * cyclePhase} min',
                        style: const TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Hot Water Duration
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                //alignment: AlignmentDirectional.topStart,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                width: 350,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: AutoSizeText(
                        'Hot Water Duration:',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AutoSizeText(
                        '$hotPhase min',
                        style: const TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Cold Water Duration
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: 350,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: AutoSizeText(
                        'Cold Water Duration:',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AutoSizeText(
                        '$coldPhase min',
                        style: const TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Number of Cycles
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                //alignment: AlignmentDirectional.topStart,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                width: 350,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: AutoSizeText(
                        'Number of Cycles:',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AutoSizeText(
                        '$cyclePhase',
                        style: const TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rate this session',
                style: TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              RatingBar(
                initialRating: 0,
                minRating: 1,
                maxRating: 5,
                allowHalfRating: false,
                glow: false,
                itemSize: 48,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                onRatingUpdate: (double value) {
                  sessionRating = value;
                },
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(Icons.star_half),
                  empty: const Icon(
                    Icons.star_border,  
                    color: Color.fromARGB(255, 186, 185, 185),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0.0, 0.3),
            child: SizedBox(
              width: 100,
              height: 50,
              child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => const HistoryPage()), (route) => false);
                  },
                  child: const Icon(
                    Icons.home,
                    size: 40,
                  )
                  //const Text(
                  //   'Home',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
