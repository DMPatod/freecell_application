import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';

class FrenchSuitedCard extends StatelessWidget {
  final int value;
  final Suit suit;

  const FrenchSuitedCard({super.key, required this.value, required this.suit});

  Color get color {
    if (suit == Suit.clubs || suit == Suit.spades) {
      return Colors.black;
    }
    return Colors.red;
  }

  String get name {
    String letter;
    switch (suit) {
      case Suit.clubs:
        letter = "C";
        break;
      case Suit.spades:
        letter = "S";
        break;
      case Suit.diamonds:
        letter = "D";
        break;
      case Suit.hearts:
        letter = "H";
        break;
    }
    return "$value of $letter";
  }

  @override
  Widget build(BuildContext context) {
    var card = Container(
      width: 100,
      height: 150,
      color: color,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    return Draggable(
      feedback: Material(
        elevation: 5,
        child: card,
      ),
      child: card,
    );
  }
}
