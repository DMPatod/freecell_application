import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_holder.dart';
import 'package:freecell_application/src/domain/card_slot.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';
import 'package:logger/logger.dart';

class CardSlot extends StatelessWidget implements CardHolder {
  final Logger logger = Logger();

  CardSlot({super.key});

  @override
  late final List<FrenchSuitedCard> cards;

  @override
  Widget build(BuildContext context) {
    CardSlotModel? inheritedData = CardSlotModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    cards = inheritedData.cards;

    if (cards.isNotEmpty) {
      return Draggable(
          data: (List<FrenchSuitedCard>.filled(1, cards.last), this),
          feedback: Material(
            elevation: 5,
            child: cards.last,
          ),
          child: cards.last);
    }

    return DragTarget(
      onAcceptWithDetails: (details) {
        var move = details.data as (List<FrenchSuitedCard>, Widget);
        var moveValidated = true;

        if (move.$1.length > 1) {
          moveValidated = false;
        }

        if (moveValidated) {
          inheritedData.callback(move.$1, move.$2, this);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 100,
          height: 150,
          color: Colors.green.shade300,
        );
      },
    );
  }
}
