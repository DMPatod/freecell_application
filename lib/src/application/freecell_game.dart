import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/presentation/cards_stack_widget.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class FreeCellGame extends StatelessWidget {
  const FreeCellGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Game"),
        ),
        body: const Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CardStack(cards: [
              FrenchSuitedCard(value: 1, suit: Suit.hearts),
              FrenchSuitedCard(value: 2, suit: Suit.clubs),
              FrenchSuitedCard(value: 3, suit: Suit.diamonds)
            ]),
            CardStack(cards: [])
          ]),
        ),
      ),
    );
  }
}

//Expanded