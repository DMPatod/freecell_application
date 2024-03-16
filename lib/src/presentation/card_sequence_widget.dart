import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecell_application/src/domain/card_sequence.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';

class CardSequence extends StatelessWidget {
  const CardSequence({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CardSequenceModel? inheritedData = CardSequenceModel.of(context);
    if (inheritedData == null) {
      return const Text("Error");
    }

    if (inheritedData.cards.isEmpty) {
      return Container(
        width: 100,
        height: 150,
        color: Colors.green,
        child: SvgPicture.asset(SuitExtension.getAssetName(inheritedData.suit)),
      );
    }
    return inheritedData.cards.last;
  }
}
