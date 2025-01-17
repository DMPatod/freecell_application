import 'package:flutter/material.dart';
import 'package:freecell_application/src/domain/move_callback.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class CardStackModel extends InheritedWidget {
  final List<FrenchSuitedCard> cards;
  final MoveCallback callback;

  const CardStackModel(this.cards, this.callback,
      {super.key, required super.child});

  static CardStackModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardStackModel>();
  }

  @override
  bool updateShouldNotify(CardStackModel oldWidget) {
    return oldWidget.cards != cards;
  }
}
