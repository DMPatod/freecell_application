import 'package:flutter/material.dart';
import 'package:freecell_application/src/presentation/board_widget.dart';

class FreeCellGame extends StatelessWidget {
  const FreeCellGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Game"),
        ),
        body: const Center(
          child: Board(),
        ),
      ),
    );
  }
}
