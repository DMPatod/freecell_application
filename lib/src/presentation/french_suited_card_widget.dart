import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecell_application/src/domain/enums/suit.dart';

class FrenchSuitedCard extends StatelessWidget {
  final int value;
  final Suit suit;

  const FrenchSuitedCard({super.key, required this.value, required this.suit});

  Color get color {
    if (suit == Suit.clubs || suit == Suit.spades) {
      return Colors.black;
    }
    return Colors.red;
  }

  String get name {
    String letter;
    switch (suit) {
      case Suit.clubs:
        letter = "C";
        break;
      case Suit.spades:
        letter = "S";
        break;
      case Suit.diamonds:
        letter = "D";
        break;
      case Suit.hearts:
        letter = "H";
        break;
    }
    return "$value of $letter";
  }

  SvgPicture get suitImage {
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
    return SvgPicture.asset(
      assetName,
      width: 25,
      height: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$value",
                style: TextStyle(color: color, fontSize: 25),
              ),
              suitImage
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                color: color,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              suitImage,
              Text(
                "$value",
                style: TextStyle(color: color, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
