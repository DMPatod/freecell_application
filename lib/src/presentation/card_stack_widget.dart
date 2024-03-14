import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_stack.dart';

class CardStack extends StatelessWidget {
  final double cardSpacing;

  const CardStack({super.key, this.cardSpacing = 20});

  @override
  Widget build(BuildContext context) {
    CardStackModel? inheritedData = CardStackModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    Widget widget;
    if (inheritedData.cards.isEmpty) {
      widget = Container(
        width: 100,
        height: 150,
        color: Colors.green.shade700,
      );
    } else {
      widget = SizedBox(
        width: 100,
        height: 150 + (cardSpacing * inheritedData.cards.length - 1),
        child: Stack(
          children: inheritedData.cards.map((e) {
            var i = inheritedData.cards.indexOf(e);
            var top = i * cardSpacing;
            return Positioned(
              top: top,
              child: Draggable(
                data: 1,
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

    return DragTarget(
        onWillAcceptWithDetails: (details) {
          return false;
        },
        onAcceptWithDetails: (details) {},
        builder: (context, candidateDate, rejectedData) {
          return SizedBox(
            width: 100,
            height: 150 + (cardSpacing * inheritedData.cards.length - 1),
            child: widget,
          );
        });
  }
}
