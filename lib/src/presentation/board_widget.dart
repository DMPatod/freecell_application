import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_sequence.dart';
import 'package:freecell_application/src/domain/card_slot.dart';
import 'package:freecell_application/src/domain/card_stack.dart';
import 'package:freecell_application/src/domain/deck.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/presentation/card_sequence_widget.dart';
import 'package:freecell_application/src/presentation/card_slot_widget.dart';
import 'package:freecell_application/src/presentation/card_stack_widget.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<StatefulWidget> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final List<FrenchSuitedCard?> _slots = List.filled(4, null);
  final List<(List<FrenchSuitedCard>, Suit)> _sequences =
      List.empty(growable: true);
  final List<List<FrenchSuitedCard>> _stacks = List.empty(growable: true);

  @override
  void initState() {
    var deck = Deck();
    deck.shufle();

    var columns = deck.distribute(8);

    for (var item in columns) {
      _stacks.add(item);
    }

    var suits = Suit.values;
    for (var item in suits) {
      _sequences.add((List<FrenchSuitedCard>.empty(), item));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                ..._slots.map((e) => Expanded(
                      child: CardSlotModel(
                        e,
                        child: const CardSlot(),
                      ),
                    ))
              ],
            )),
            const Divider(),
            Expanded(
                child: Row(
              children: [
                ..._sequences.map((e) => Expanded(
                      child: CardSequenceModel(
                        e.$1,
                        e.$2,
                        child: const CardSequence(),
                      ),
                    ))
              ],
            ))
          ],
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._stacks.map((e) => Expanded(
                  child: CardStackModel(
                    e,
                    child: const CardStack(),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
