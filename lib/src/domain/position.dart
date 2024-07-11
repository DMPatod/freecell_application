import 'package:freecell_application/src/domain/enums/board_position.dart';

class Position {
  final BoardPosition boardPosition;
  final int index;
  final int depth;

  const Position(
      {required this.boardPosition, required this.index, required this.depth});
}
