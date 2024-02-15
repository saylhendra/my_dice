import 'dart:ui';

import 'package:flutter/material.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('My Dice'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ClipRRect(
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: Image.asset('assets/images/1.png', width: 200, height: 200)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '\"Roller dice\" could refer to a couple of things depending on the context, but it generally means dice that are rolled to generate random numbers, typically used in board games, role-playing games (RPGs), and educational activities. When you "roll dice" or use "roller dice," you\'re simply throwing one or more dice to see what numbers come up on the top-facing surfaces after they settle. This action is fundamental to many games and activities that require an element of chance or randomness.',
                  style: TextStyle(fontSize: 22.0)),
            ),
          ],
        ),
      ),
    );
  }
}
