import 'package:freecell_application/src/presentation/french_suited_card_widget.dart';

abstract class CardHolder {
  late final List<FrenchSuitedCard> cards;

  CardHolder(this.cards);
}
