import 'package:flutter/material.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class CardStack extends StatelessWidget {
  final List<FrenchSuitedCard> cards;
  final double cardSpacing;

  const CardStack({super.key, required this.cards, this.cardSpacing = 20});

  @override
  Widget build(BuildContext context) {
    Widget e;
    if (cards.isEmpty) {
      e = Container(
        width: 100,
        height: 150,
        color: Colors.green.shade700,
      );
    } else {
      e = SizedBox(
        width: 100,
        height: 150 + (cardSpacing * (cards.length - 1)),
        child: Stack(
          alignment: Alignment.center,
          children: cards.map((el) {
            var i = cards.indexOf(el);
            var top = i * cardSpacing;
            return Positioned(top: top, child: el);
          }).toList(),
        ),
      );
    }

    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (data) {
      print(data);
    }, builder: (context, candidateData, rejectedData) {
      return SizedBox(
        width: 100,
        height: 150 + (cardSpacing * (cards.length - 1)),
        child: e,
      );
    });
  }
}
