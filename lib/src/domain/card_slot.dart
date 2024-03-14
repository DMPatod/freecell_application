import 'package:flutter/widgets.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class CardSlotModel extends InheritedWidget {
  final FrenchSuitedCard card;

  const CardSlotModel(this.card, {super.key, required super.child});

  static CardSlotModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardSlotModel>();
  }

  @override
  bool updateShouldNotify(CardSlotModel oldWidget) {
    return oldWidget.card != card;
  }
}
