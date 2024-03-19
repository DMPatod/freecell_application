import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecell_application/src/domain/card_holder.dart';
import 'package:freecell_application/src/domain/card_sequence.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';
import 'package:logger/logger.dart';

class CardSequence extends StatelessWidget implements CardHolder {
  final Logger logger = Logger();

  CardSequence({
    super.key,
  });

  @override
  late final List<FrenchSuitedCard> cards;

  @override
  Widget build(BuildContext context) {
    CardSequenceModel? inheritedData = CardSequenceModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    cards = inheritedData.cards;

    Widget child;
    if (cards.isEmpty) {
      child = Container(
        width: 100,
        height: 150,
        color: Colors.green,
        child: SvgPicture.asset(SuitExtension.getAssetName(inheritedData.suit)),
      );
    } else {
      child = cards.last;
    }

    return DragTarget(
      onAcceptWithDetails: (details) {
        var move = details.data as (List<FrenchSuitedCard>, Widget);
        var moveValidated = true;

        if (move.$1.length > 1) {
          moveValidated = false;
        }

        if (cards.isNotEmpty) {
          if (move.$1.first.value != cards.last.value + 1) {
            moveValidated = false;
          }
        } else {
          if (move.$1.first.value != 1) {
            moveValidated = false;
          }
        }

        if (move.$1.first.suit != inheritedData.suit) {
          moveValidated = false;
        }

        if (moveValidated) {
          inheritedData.callback(move.$1, move.$2, this);
        }
      },
      builder: (context, candidateData, rejectedData) {
        return child;
      },
    );
  }
}
