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
    return inheritedData.card;
  }
}
