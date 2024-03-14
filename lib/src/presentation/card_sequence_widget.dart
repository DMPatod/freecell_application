import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_sequence.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';

class CardSequence extends StatelessWidget {
  final double cardSpacing;

  const CardSequence({
    super.key,
    this.cardSpacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    CardSequenceModel? inheritedData = CardSequenceModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    Color color;
    switch (inheritedData.suit) {
      case Suit.clubs:
        color = Colors.black;
        break;
      case Suit.hearts:
        color = Colors.green;
        break;
      case Suit.diamonds:
        color = Colors.red;
        break;
      case Suit.spades:
        color = Colors.yellow;
        break;
    }

    if (inheritedData.cards.isEmpty) {
      return Container(
        width: 100,
        height: 150,
        color: color,
      );
    }
    return inheritedData.cards.last;
  }
}
