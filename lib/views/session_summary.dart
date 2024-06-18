import 'package:auto_size_text/auto_size_text.dart';
import 'package:contrast_shower_companion/main.dart';
import 'package:contrast_shower_companion/views/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class SessionSummary extends ConsumerWidget {
  const SessionSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotPhase = int.tryParse(ref.read(hotPhaseProvider))! ;
    final coldPhase = int.tryParse(ref.read(coldPhaseProvider))!;
    final cyclePhase = int.tryParse(ref.read(cyclesProvider) ) ?? 0;
    double sessionRating = 3; ///Default value
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Session Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        automaticallyImplyLeading: false,
      ),
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
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
            ]
          ),

          Center(
            child: RatingBar(
              initialRating: 3,
              minRating: 1, 
              maxRating: 5,
              allowHalfRating: false, 
              glow: false,
              itemSize: 50,
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
                  Icons.star,
                  color: Color.fromARGB(255, 205, 204, 204),
                ), 
              ),
            ),
          ),

          Positioned(
            bottom: 250,
            left: 130,
            right: 130,
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 230, 230, 230),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp())
                );
              }, 
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}