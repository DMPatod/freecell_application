import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_holder.dart';
import 'package:freecell_application/src/domain/card_stack.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';
import 'package:logger/logger.dart';

class CardStack extends StatelessWidget implements CardHolder {
  final Logger logger = Logger();
  final double cardSpacing;

  CardStack({super.key, this.cardSpacing = 50});

  @override
  late final List<FrenchSuitedCard> cards;

  @override
  Widget build(BuildContext context) {
    CardStackModel? inheritedData = CardStackModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    cards = inheritedData.cards;

    Widget widget;
    if (cards.isEmpty) {
      widget = Container(
        width: 100,
        height: 150,
        color: Colors.green.shade700,
      );
    } else {
      widget = SizedBox(
        width: 100,
        height: 150 + (cardSpacing * cards.length - 1),
        child: Stack(
          alignment: Alignment.center,
          children: cards.map((e) {
            var i = cards.indexOf(e);
            var top = i * cardSpacing;

            var set = List<FrenchSuitedCard>.empty(growable: true);
            for (int j = i; j < cards.length; j++) {
              set.add(cards[j]);
            }

            return Positioned(
              top: top,
              child: Draggable(
                data: (set, this),
                feedback: Material(
                  elevation: 5,
                  child: e,
                ),
                child: e,
              ),
            );
          }).toList(),
        ),
      );
    }

    return DragTarget(onAcceptWithDetails: (details) {
      var move = details.data as (List<FrenchSuitedCard>, Widget);
      var moveValidated = true;

      if (move.$1.first.value != cards.last.value - 1) {
        moveValidated = false;
      }

      if (move.$1.first.color == cards.last.color) {
        moveValidated = false;
      }

      if (moveValidated) {
        inheritedData.callback(move.$1, move.$2, this);
      }
    }, builder: (context, candidateData, rejectedData) {
      return SizedBox(
        width: 100,
        height: 150 + (cardSpacing * cards.length - 1),
        child: widget,
      );
    });
  }
}
