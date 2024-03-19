import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/domain/move_callback.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class CardSequenceModel extends InheritedWidget {
  final List<FrenchSuitedCard> cards;
  final Suit suit;
  final MoveCallback callback;

  const CardSequenceModel(this.cards, this.suit, this.callback,
      {super.key, required super.child});

  static CardSequenceModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardSequenceModel>();
  }

  @override
  bool updateShouldNotify(CardSequenceModel oldWidget) {
    return oldWidget.cards != cards;
  }
}
