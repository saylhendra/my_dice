import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  var _currentNumberDice = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dice'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              firstChild: Image.asset('assets/images/$_currentNumberDice.png', width: 150),
              secondChild: Image.asset('assets/images/$_currentNumberDice.png', width: 150),
              crossFadeState: _currentNumberDice == 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              // child: Center(
              //   child: Image.asset('assets/images/$_currentNumberDice.png', width: 150),
              // ),
            ),
          ),
          Expanded(
            flex: 0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentNumberDice = 1 + Random().nextInt(6);
                });
              },
              child: const Text('Roll'),
            ),
          ),
          const Expanded(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
