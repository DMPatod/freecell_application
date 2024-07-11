import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/card_holder.dart';
import 'package:freecell_application/src/domain/card_sequence.dart';
import 'package:freecell_application/src/domain/card_slot.dart';
import 'package:freecell_application/src/domain/card_stack.dart';
import 'package:freecell_application/src/domain/deck.dart';
import 'package:freecell_application/src/domain/enums/board_position.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/domain/move_callback.dart';
import 'package:freecell_application/src/domain/movement.dart';
import 'package:freecell_application/src/domain/position.dart';
import 'package:freecell_application/src/presentation/card_sequence_widget.dart';
import 'package:freecell_application/src/presentation/card_slot_widget.dart';
import 'package:freecell_application/src/presentation/card_stack_widget.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';
import 'package:logger/logger.dart';

class Board extends StatefulWidget {
  final Logger logger = Logger();

  Board({super.key});

  @override
  State<StatefulWidget> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final Logger logger = Logger();

  final List<List<FrenchSuitedCard>> _slots = List.empty(growable: true);
  final List<(List<FrenchSuitedCard>, Suit)> _sequences =
      List.empty(growable: true);
  final List<List<FrenchSuitedCard>> _stacks = List.empty(growable: true);

  final List<Movement> _movements = List.empty(growable: true);

  int life = 5;

  @override
  void initState() {
    var deck = Deck();
    deck.shufle();

    var columns = deck.distribute(8);

    for (var item in columns) {
      _stacks.add(item);
    }

    for (var i = 0; i < 4; i++) {
      _slots.add(List<FrenchSuitedCard>.empty(growable: true));
    }

    var suits = Suit.values;
    for (var item in suits) {
      _sequences.add((List<FrenchSuitedCard>.empty(growable: true), item));
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ..._slots.map((e) => CardSlotModel(
                      e,
                      moveCallback,
                      child: CardSlot(),
                    ))
              ],
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ..._sequences.map(
                    (e) => CardSequenceModel(
                      e.$1,
                      e.$2,
                      moveCallback,
                      child: CardSequence(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._stacks.map((e) => Expanded(
                  child: CardStackModel(
                    e,
                    moveCallback,
                    child: CardStack(),
                  ),
                ))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Text("Undo"),
            ),
            MaterialButton(
              onPressed: () {
                Map<String, Position> dic = {};

                for (var i = 0; i < [_stacks, _slots, _sequences].length; i++) {
                  BoardPosition pos;
                  List<List<FrenchSuitedCard>> collection;
                  switch (i) {
                    case 0:
                      collection = _stacks;
                      pos = BoardPosition.stack;
                      break;
                    case 1:
                      collection = _slots;
                      pos = BoardPosition.slot;
                      break;
                    case 2:
                      collection = _sequences.map((e) => e.$1).toList();
                      pos = BoardPosition.sequence;
                      break;
                    default:
                      throw Exception("Position Not Implemented");
                  }

                  for (var list in collection) {
                    var i = collection.indexOf(list);
                    for (var card in list) {
                      dic[card.name] = Position(
                          boardPosition: pos,
                          index: i,
                          depth: list.indexOf(card));
                    }
                  }
                }

                logger.d(dic);
              },
              child: const Text("Export"),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text("Solver"),
            )
          ],
        )
      ],
    );
  }

  MoveCallback get moveCallback =>
      (List<FrenchSuitedCard> set, Widget from, Widget to) {
        setState(() {
          var fromHolder = from as CardHolder;

          for (int i = 0; i < set.length; i++) {
            fromHolder.cards.removeLast();
          }

          var toHolder = to as CardHolder;
          toHolder.cards.addAll(set);
        });
      };
}
