enum Suit { hearts, clubs, diamonds, spades }

abstract class SuitExtension {
  static String getAssetName(Suit suit) {
    String assetName = "";
    switch (suit) {
      case Suit.clubs:
        assetName = "lib/images/clubs.svg";
        break;
      case Suit.spades:
        assetName = "lib/images/spades.svg";
        break;
      case Suit.diamonds:
        assetName = "lib/images/diamonds.svg";
        break;
      case Suit.hearts:
        assetName = "lib/images/hearts.svg";
        break;
    }
    return assetName;
  }
}
