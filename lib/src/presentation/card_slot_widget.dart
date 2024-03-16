import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_slot.dart';

class CardSlot extends StatelessWidget {
  const CardSlot({super.key});

  @override
  Widget build(BuildContext context) {
    CardSlotModel? inheritedData = CardSlotModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    if (inheritedData.card == null) {
      return DragTarget(
        onAcceptWithDetails: (details) {},
        builder: (context, candidateData, rejectedData) {
          return Container(
              width: 100, height: 150, color: Colors.green.shade300);
        },
      );
    }

    return Draggable(
        data: (inheritedData.card!, context.widget),
        feedback: Material(
          elevation: 5,
          child: inheritedData.card!,
        ),
        child: inheritedData.card!);
  }
}
