import 'package:flutter/material.dart';
import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

typedef MoveCallback = void Function(
    List<FrenchSuitedCard> set, Widget from, Widget to);


// 12 de Coracao -> pilha 1 pos 2
// Dic -> key: Card.value; value: (Widget, x, index)