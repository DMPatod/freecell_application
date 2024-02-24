import 'package:flutter/material.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class BoardModel extends ChangeNotifier {
  final List<List<FrenchSuitedCard>> _stacks = List.empty(growable: true);

  BoardModel() {
    for (var i = 0; i < 8; i++) {
      _stacks.add(List.empty(growable: true));
    }
  }

  List<FrenchSuitedCard> stackCards(int index) {
    return _stacks[index];
  }

  void addStackCard(FrenchSuitedCard card, int index) {
    _stacks[index].add(card);
    notifyListeners();
  }
}
