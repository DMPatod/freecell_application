import 'package:flutter/widgets.dart';
import 'package:freecell_application/src/domain/move_callback.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class CardSlotModel extends InheritedWidget {
  final List<FrenchSuitedCard> cards;
  final MoveCallback callback;

  const CardSlotModel(this.cards, this.callback,
      {super.key, required super.child});

  static CardSlotModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardSlotModel>();
  }

  @override
  bool updateShouldNotify(CardSlotModel oldWidget) {
    return oldWidget.cards != cards;
  }
}
