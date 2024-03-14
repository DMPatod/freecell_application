import 'dart:math';

import 'package:freecell_application/src/domain/enums/suit.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

class Deck {
  final List<FrenchSuitedCard> _cards = List.empty(growable: true);

  Deck() {
    var suits = Suit.values;
    for (var item in suits) {
      for (int i = 1; i <= 13; i++) {
        _cards.add(FrenchSuitedCard(value: i, suit: item));
      }
    }
  }

  void shufle() {
    var rand = Random();
    var size = _cards.length;
    for (var i = 1; i < size; i++) {
      var index = i + rand.nextInt(size - i);
      var card = _cards[i];
      _cards[i] = _cards[index];
      _cards[index] = card;
    }
  }

  List<List<FrenchSuitedCard>> distribute(int numColumns) {
    var columns = List<List<FrenchSuitedCard>>.empty(growable: true);
    for (var i = 0; i < numColumns; i++) {
      columns.add(List.empty(growable: true));
    }

    for (var i = 0; _cards.isNotEmpty; i = (i + 1) % columns.length) {
      columns[i].add(_cards.removeLast());
    }

    return columns;
  }
}
