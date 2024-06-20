import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTest extends ConsumerStatefulWidget {
  const MyTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyTestState();
}

class _MyTestState extends ConsumerState<MyTest> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
            ],
          ),
        ),
       Expanded(
          child: Column(
            children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
            ],
          ),
        ),
      ],
    );
  }
}